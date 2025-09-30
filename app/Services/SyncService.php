<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class SyncService
{
    /**
     * Models that support synchronization
     */
    private static $syncableModels = [
        'App\Models\Vaccination',
        'App\Models\Medication',
        'App\Models\Calving',
        'App\Models\Deworming',
        'App\Models\PregnancyDiagnosis',
        'App\Models\VaccinationDose',
        // Add other models as they are updated
    ];

    /**
     * Sync records from device to server
     *
     * @param array $records Array of records to sync
     * @param string $modelClass Model class name
     * @param string $deviceId Device identifier
     * @return array Sync results
     */
    public static function syncFromDevice(array $records, string $modelClass, string $deviceId): array
    {
        $results = [
            'success' => 0,
            'conflicts' => 0,
            'errors' => 0,
            'conflicted_records' => [],
            'synced_records' => []
        ];

        DB::beginTransaction();

        try {
            foreach ($records as $recordData) {
                $result = self::processSingleRecord($recordData, $modelClass, $deviceId);

                if ($result['status'] === 'success') {
                    $results['success']++;
                    $results['synced_records'][] = $result['record'];
                } elseif ($result['status'] === 'conflict') {
                    $results['conflicts']++;
                    $results['conflicted_records'][] = $result['record'];
                } else {
                    $results['errors']++;
                }
            }

            DB::commit();
            Log::info("Sync completed for {$modelClass}", $results);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error("Sync failed for {$modelClass}: " . $e->getMessage());
            throw $e;
        }

        return $results;
    }

    /**
     * Process a single record for synchronization
     */
    private static function processSingleRecord(array $recordData, string $modelClass, string $deviceId): array
    {
        try {
            // Find existing record by UUID
            $existingRecord = null;
            if (!empty($recordData['uuid'])) {
                $existingRecord = $modelClass::where('uuid', $recordData['uuid'])->first();
            }

            // If no existing record found, create new one
            if (!$existingRecord) {
                $newRecord = new $modelClass();
                $newRecord->fill($recordData);
                $newRecord->device_id = $deviceId;
                $newRecord->sync_status = 'synced';
                $newRecord->save();

                return [
                    'status' => 'success',
                    'action' => 'created',
                    'record' => $newRecord->toSyncPayload()
                ];
            }

            // Handle existing record - check for conflicts
            $incomingTimestamp = Carbon::parse($recordData['last_modified_at'] ?? now());
            $existingTimestamp = $existingRecord->last_modified_at;

            // If incoming record is newer, update existing
            if ($incomingTimestamp > $existingTimestamp) {
                $existingRecord->fill($recordData);
                $existingRecord->last_modified_at = $incomingTimestamp;
                $existingRecord->device_id = $deviceId;
                $existingRecord->sync_status = 'synced';
                $existingRecord->save();

                return [
                    'status' => 'success',
                    'action' => 'updated',
                    'record' => $existingRecord->toSyncPayload()
                ];
            }

            // If existing record is newer, mark as conflict
            $existingRecord->markAsConflicted();

            return [
                'status' => 'conflict',
                'action' => 'conflict_detected',
                'record' => [
                    'local' => $existingRecord->toSyncPayload(),
                    'incoming' => $recordData,
                    'conflict_reason' => 'local_record_newer'
                ]
            ];

        } catch (\Exception $e) {
            Log::error("Error processing record: " . $e->getMessage(), ['record' => $recordData]);
            return [
                'status' => 'error',
                'action' => 'processing_failed',
                'error' => $e->getMessage()
            ];
        }
    }

    /**
     * Get records that need to be synced to devices
     *
     * @param string $modelClass Model class name
     * @param string $deviceId Device identifier (optional)
     * @param Carbon $lastSyncTime Last sync timestamp (optional)
     * @return array Records to sync
     */
    public static function getRecordsForSync(string $modelClass, string $deviceId = null, Carbon $lastSyncTime = null): array
    {
        $query = $modelClass::query();

        // Get records modified after last sync time
        if ($lastSyncTime) {
            $query->modifiedAfter($lastSyncTime);
        }

        // Exclude records from the same device to prevent loops
        if ($deviceId) {
            $query->where(function($q) use ($deviceId) {
                $q->where('device_id', '!=', $deviceId)
                  ->orWhereNull('device_id');
            });
        }

        // Only get records that are synced or have conflicts
        $query->whereIn('sync_status', ['synced', 'conflict']);

        // Include soft deleted records for proper sync
        $query->withTrashed();

        $records = $query->get();

        return $records->map(function($record) {
            return $record->toSyncPayload();
        })->toArray();
    }

    /**
     * Resolve conflicts for a specific model
     *
     * @param string $modelClass Model class name
     * @param string $strategy Conflict resolution strategy
     * @return array Resolution results
     */
    public static function resolveConflicts(string $modelClass, string $strategy = 'last_write_wins'): array
    {
        $conflictedRecords = $modelClass::where('sync_status', 'conflict')->get();
        $resolved = 0;

        foreach ($conflictedRecords as $record) {
            try {
                // Find other records with same UUID but different timestamps
                $otherRecords = $modelClass::where('uuid', $record->uuid)
                    ->where('id', '!=', $record->id)
                    ->get();

                foreach ($otherRecords as $otherRecord) {
                    $winner = $record->resolveConflictWith($otherRecord, $strategy);

                    if ($winner->id === $record->id) {
                        // Current record wins, mark as synced
                        $record->markAsSynced();
                        // Delete or mark the other record
                        $otherRecord->delete();
                    } else {
                        // Other record wins, delete current record
                        $record->delete();
                    }

                    $resolved++;
                }

            } catch (\Exception $e) {
                Log::error("Error resolving conflict for record {$record->id}: " . $e->getMessage());
            }
        }

        return ['resolved' => $resolved];
    }

    /**
     * Clean up old sync records
     *
     * @param int $daysOld Days to keep records
     * @return int Number of cleaned records
     */
    public static function cleanupOldRecords(int $daysOld = 30): int
    {
        $cutoffDate = Carbon::now()->subDays($daysOld);
        $cleaned = 0;

        foreach (self::$syncableModels as $modelClass) {
            try {
                $deletedCount = $modelClass::onlyTrashed()
                    ->where('deleted_at', '<', $cutoffDate)
                    ->forceDelete();

                $cleaned += $deletedCount;
            } catch (\Exception $e) {
                Log::error("Error cleaning up {$modelClass}: " . $e->getMessage());
            }
        }

        return $cleaned;
    }

    /**
     * Get sync statistics for all models
     *
     * @return array Sync statistics
     */
    public static function getSyncStatistics(): array
    {
        $stats = [];

        foreach (self::$syncableModels as $modelClass) {
            try {
                $modelName = class_basename($modelClass);
                $stats[$modelName] = [
                    'total' => $modelClass::count(),
                    'pending_sync' => $modelClass::where('sync_status', 'pending')->count(),
                    'synced' => $modelClass::where('sync_status', 'synced')->count(),
                    'conflicts' => $modelClass::where('sync_status', 'conflict')->count(),
                    'deleted' => $modelClass::onlyTrashed()->count(),
                ];
            } catch (\Exception $e) {
                $stats[class_basename($modelClass)] = ['error' => $e->getMessage()];
            }
        }

        return $stats;
    }

    /**
     * Bulk update sync status for records
     *
     * @param string $modelClass Model class name
     * @param array $uuids Array of UUIDs
     * @param string $status New sync status
     * @return int Number of updated records
     */
    public static function bulkUpdateSyncStatus(string $modelClass, array $uuids, string $status): int
    {
        return $modelClass::whereIn('uuid', $uuids)
            ->update([
                'sync_status' => $status,
                'last_modified_at' => now()
            ]);
    }

    /**
     * Generate device-specific UUID for records without UUID
     *
     * @param string $modelClass Model class name
     * @return int Number of records updated
     */
    public static function generateMissingUUIDs(string $modelClass): int
    {
        $recordsWithoutUUID = $modelClass::whereNull('uuid')->get();
        $updated = 0;

        foreach ($recordsWithoutUUID as $record) {
            try {
                $record->uuid = \Illuminate\Support\Str::uuid()->toString();
                $record->save();
                $updated++;
            } catch (\Exception $e) {
                Log::error("Error generating UUID for record {$record->id}: " . $e->getMessage());
            }
        }

        return $updated;
    }
}
