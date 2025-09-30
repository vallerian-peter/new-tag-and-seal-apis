<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\SyncService;
use App\Models\Vaccination;
use App\Models\Medication;
use App\Models\Calving;
use App\Models\Deworming;
use App\Models\PregnancyDiagnosis;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class ComprehensiveSyncController extends Controller
{
    protected $syncService;

    public function __construct(SyncService $syncService)
    {
        $this->syncService = $syncService;
    }

    /**
     * Upload records from client to server
     */
    public function upload(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'table_name' => 'required|string',
                'device_id' => 'required|string',
                'records' => 'required|array',
                'records.*.uuid' => 'required|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 400);
            }

            $tableName = $request->table_name;
            $deviceId = $request->device_id;
            $records = $request->records;

            Log::info("Sync upload started", [
                'table' => $tableName,
                'device_id' => $deviceId,
                'record_count' => count($records)
            ]);

            $result = [
                'uploaded' => 0,
                'conflicts' => 0,
                'errors' => 0,
                'synced_records' => [],
                'conflicted_records' => [],
                'error_records' => []
            ];

            DB::beginTransaction();

            foreach ($records as $recordData) {
                try {
                    $uploadResult = $this->processUploadRecord($tableName, $recordData, $deviceId);

                    if ($uploadResult['status'] === 'uploaded') {
                        $result['uploaded']++;
                        $result['synced_records'][] = ['uuid' => $recordData['uuid']];
                    } elseif ($uploadResult['status'] === 'conflict') {
                        $result['conflicts']++;
                        $result['conflicted_records'][] = [
                            'uuid' => $recordData['uuid'],
                            'conflict_reason' => $uploadResult['reason']
                        ];
                    } else {
                        $result['errors']++;
                        $result['error_records'][] = [
                            'uuid' => $recordData['uuid'],
                            'error' => $uploadResult['error']
                        ];
                    }
                } catch (\Exception $e) {
                    $result['errors']++;
                    $result['error_records'][] = [
                        'uuid' => $recordData['uuid'] ?? 'unknown',
                        'error' => $e->getMessage()
                    ];
                    Log::error("Record upload error", [
                        'uuid' => $recordData['uuid'] ?? 'unknown',
                        'error' => $e->getMessage()
                    ]);
                }
            }

            DB::commit();

            Log::info("Sync upload completed", [
                'table' => $tableName,
                'result' => $result
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Upload processed successfully',
                'data' => $result
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Sync upload failed", ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Upload failed: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Download records from server to client
     */
    public function download(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'table_name' => 'required|string',
                'device_id' => 'required|string',
                'last_sync_time' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 400);
            }

            $tableName = $request->table_name;
            $deviceId = $request->device_id;
            $lastSyncTime = $request->last_sync_time;

            Log::info("Sync download started", [
                'table' => $tableName,
                'device_id' => $deviceId,
                'last_sync_time' => $lastSyncTime
            ]);

            $records = $this->getRecordsForDownload($tableName, $deviceId, $lastSyncTime);

            Log::info("Sync download completed", [
                'table' => $tableName,
                'record_count' => count($records)
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Download successful',
                'data' => [
                    'records' => $records,
                    'count' => count($records),
                    'timestamp' => now()->toIso8601String()
                ]
            ]);

        } catch (\Exception $e) {
            Log::error("Sync download failed", ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Download failed: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get sync statistics
     */
    public function getStatistics(Request $request)
    {
        try {
            $deviceId = $request->device_id;

            $stats = [
                'vaccinations' => $this->getTableStats('vaccinations', $deviceId),
                'medications' => $this->getTableStats('medications', $deviceId),
                'calvings' => $this->getTableStats('calvings', $deviceId),
                'dewormings' => $this->getTableStats('dewormings', $deviceId),
                'pregnancy_diagnosis' => $this->getTableStats('pregnancy_diagnosis', $deviceId),
                'feedings' => $this->getTableStats('feedings', $deviceId),
                'milkings' => $this->getTableStats('milkings', $deviceId),
                'inseminations' => $this->getTableStats('inseminations', $deviceId),
                'weight_gains' => $this->getTableStats('weight_gains', $deviceId),
                'drying_offs' => $this->getTableStats('drying_offs', $deviceId),
                'animal_disposals' => $this->getTableStats('animal_disposals', $deviceId),
                'transfers' => $this->getTableStats('transfers', $deviceId),
            ];

            return response()->json([
                'status' => true,
                'message' => 'Statistics retrieved successfully',
                'data' => $stats
            ]);

        } catch (\Exception $e) {
            Log::error("Get statistics failed", ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Failed to get statistics: ' . $e->getMessage()
            ], 500);
        }
    }


    /**
     * Get records for download
     */
    protected function getRecordsForDownload($tableName, $deviceId, $lastSyncTime = null)
    {
        $model = $this->getModelForTable($tableName);
        if (!$model) {
            return [];
        }

        $query = $model::query();

        // Exclude records from the same device to avoid loops
        $query->where(function($q) use ($deviceId) {
            $q->where('device_id', '!=', $deviceId)
              ->orWhereNull('device_id');
        });

        // Only get records modified after last sync
        if ($lastSyncTime) {
            $query->where('last_modified_at', '>', $lastSyncTime);
        }

        // Get recent records (last 30 days max)
        $query->where('created_at', '>', now()->subDays(30));

        // Limit results to prevent large downloads
        $query->limit(100);

        return $query->get()->toArray();
    }


    /**
     * Get model class for table name
     */
    protected function getModelForTable($tableName)
    {
        $models = [
            'vaccinations' => Vaccination::class,
            'medications' => Medication::class,
            'calvings' => Calving::class,
            'dewormings' => Deworming::class,
            'pregnancy_diagnosis' => PregnancyDiagnosis::class,
            // Note: For tables without dedicated models, we'll use generic DB operations
            'feedings' => null,
            'milkings' => null,
            'inseminations' => null,
            'weight_gains' => null,
            'drying_offs' => null,
            'animal_disposals' => null,
            'transfers' => null,
        ];

        return $models[$tableName] ?? null;
    }

    /**
     * Process upload of a single record
     */
    protected function processUploadRecord($tableName, $recordData, $deviceId)
    {
        try {
            // Set device_id and last_modified_at
            $recordData['device_id'] = $deviceId;
            $recordData['last_modified_at'] = now();

            $model = $this->getModelForTable($tableName);

            if ($model) {
                // Use model-based approach for tables with models
                return $this->processModelRecord($model, $recordData);
            } else {
                // Use direct DB approach for tables without models
                return $this->processDirectDbRecord($tableName, $recordData);
            }
        } catch (\Exception $e) {
            Log::error("Process upload record error", [
                'table' => $tableName,
                'uuid' => $recordData['uuid'] ?? 'unknown',
                'error' => $e->getMessage()
            ]);
            return ['status' => 'error', 'error' => $e->getMessage()];
        }
    }

    /**
     * Process record using model
     */
    protected function processModelRecord($model, $recordData)
    {
        // Check if record exists by UUID
        $existingRecord = $model::where('uuid', $recordData['uuid'])->first();

        if (!$existingRecord) {
            // Create new record
            try {
                $recordData['sync_status'] = 'synced';
                $model::create($recordData);
                return ['status' => 'uploaded'];
            } catch (\Exception $e) {
                return ['status' => 'error', 'error' => $e->getMessage()];
            }
        } else {
            // Handle conflict resolution
            return $this->resolveRecordConflict($existingRecord, $recordData);
        }
    }

    /**
     * Process record using direct DB operations
     */
    protected function processDirectDbRecord($tableName, $recordData)
    {
        // Check if record exists by UUID
        $existingRecord = DB::table($tableName)
            ->where('uuid', $recordData['uuid'])
            ->first();

        if (!$existingRecord) {
            // Create new record
            try {
                $recordData['sync_status'] = 'synced';
                $recordData['created_at'] = now();
                $recordData['updated_at'] = now();

                DB::table($tableName)->insert($recordData);
                return ['status' => 'uploaded'];
            } catch (\Exception $e) {
                return ['status' => 'error', 'error' => $e->getMessage()];
            }
        } else {
            // Handle conflict resolution for direct DB
            return $this->resolveDirectDbConflict($tableName, $existingRecord, $recordData);
        }
    }

    /**
     * Resolve conflict for direct DB record
     */
    protected function resolveDirectDbConflict($tableName, $existingRecord, $recordData)
    {
        $clientModified = isset($recordData['last_modified_at'])
            ? Carbon::parse($recordData['last_modified_at'])
            : now();
        $serverModified = $existingRecord->last_modified_at
            ? Carbon::parse($existingRecord->last_modified_at)
            : Carbon::parse($existingRecord->updated_at ?? now());

        // Use last-write-wins strategy
        if ($clientModified->greaterThan($serverModified)) {
            // Client is newer, update server record
            try {
                $recordData['updated_at'] = now();
                DB::table($tableName)
                    ->where('uuid', $recordData['uuid'])
                    ->update($recordData);
                return ['status' => 'uploaded'];
            } catch (\Exception $e) {
                return ['status' => 'error', 'error' => $e->getMessage()];
            }
        } else {
            // Server is newer or same, conflict detected
            return [
                'status' => 'conflict',
                'reason' => 'Server record is newer or same timestamp'
            ];
        }
    }

    /**
     * Get statistics for a table
     */
    protected function getTableStats($tableName, $deviceId = null)
    {
        try {
            $model = $this->getModelForTable($tableName);

            if ($model) {
                // Use model approach
                $total = $model::count();
                $pending = $model::where('sync_status', 'pending')->count();
                $synced = $model::where('sync_status', 'synced')->count();
                $conflicts = $model::where('sync_status', 'conflict')->count();
                $deleted = $model::where('sync_status', 'deleted')->count();
                $deviceRecords = $deviceId ? $model::where('device_id', $deviceId)->count() : 0;
            } else {
                // Use direct DB approach
                $total = DB::table($tableName)->count();
                $pending = DB::table($tableName)->where('sync_status', 'pending')->count();
                $synced = DB::table($tableName)->where('sync_status', 'synced')->count();
                $conflicts = DB::table($tableName)->where('sync_status', 'conflict')->count();
                $deleted = DB::table($tableName)->where('sync_status', 'deleted')->count();
                $deviceRecords = $deviceId ? DB::table($tableName)->where('device_id', $deviceId)->count() : 0;
            }

            return [
                'total' => $total,
                'pending' => $pending,
                'synced' => $synced,
                'conflicts' => $conflicts,
                'deleted' => $deleted,
                'device_records' => $deviceRecords
            ];
        } catch (\Exception $e) {
            return [
                'error' => 'Table not found or not accessible: ' . $e->getMessage()
            ];
        }
    }

    /**
     * Resolve conflicts for a table
     */
    public function resolveConflicts(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'table_name' => 'required|string',
                'strategy' => 'required|string|in:last_write_wins,server_wins,client_wins',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 400);
            }

            $tableName = $request->table_name;
            $strategy = $request->strategy;
            $model = $this->getModelForTable($tableName);

            if (!$model) {
                return response()->json([
                    'status' => false,
                    'message' => 'Unsupported table: ' . $tableName
                ], 400);
            }

            $conflictedRecords = $model::where('sync_status', 'conflict')->get();
            $resolved = 0;

            foreach ($conflictedRecords as $record) {
                try {
                    // For now, just mark as synced (implement actual conflict resolution logic as needed)
                    $record->update(['sync_status' => 'synced']);
                    $resolved++;
                } catch (\Exception $e) {
                    Log::error("Conflict resolution error", [
                        'uuid' => $record->uuid,
                        'error' => $e->getMessage()
                    ]);
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Conflicts resolved successfully',
                'data' => ['resolved' => $resolved]
            ]);

        } catch (\Exception $e) {
            Log::error("Resolve conflicts failed", ['error' => $e->getMessage()]);

            return response()->json([
                'status' => false,
                'message' => 'Failed to resolve conflicts: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Health check endpoint
     */
    public function healthCheck()
    {
        try {
            // Test database connection
            DB::connection()->getPdo();

            // Get system info
            $info = [
                'status' => 'healthy',
                'timestamp' => now()->toIso8601String(),
                'database' => 'connected',
                'supported_tables' => [
                    'vaccinations', 'medications', 'calvings', 'dewormings', 'pregnancy_diagnosis',
                    'feedings', 'milkings', 'inseminations', 'weight_gains', 'drying_offs',
                    'animal_disposals', 'transfers'
                ],
                'version' => '1.0.0'
            ];

            return response()->json([
                'status' => true,
                'message' => 'Sync service is healthy',
                'data' => $info
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Sync service is unhealthy: ' . $e->getMessage()
            ], 500);
        }
    }
}
