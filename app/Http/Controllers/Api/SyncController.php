<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Services\SyncService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class SyncController extends Controller
{
    /**
     * Model mapping for sync endpoints
     */
    private $modelMap = [
        'vaccinations' => 'App\Models\Vaccination',
        'medications' => 'App\Models\Medication',
        'calvings' => 'App\Models\Calving',
        'dewormings' => 'App\Models\Deworming',
        'pregnancy_diagnosis' => 'App\Models\PregnancyDiagnosis',
        'vaccination_doses' => 'App\Models\VaccinationDose',
    ];

    /**
     * Sync records from device to server
     *
     * @param Request $request
     * @param string $modelType
     * @return JsonResponse
     */
    public function syncToServer(Request $request, string $modelType): JsonResponse
    {
        // Validate model type
        if (!isset($this->modelMap[$modelType])) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid model type',
                'data' => null
            ], 400);
        }

        // Validate request
        $validator = Validator::make($request->all(), [
            'device_id' => 'required|string',
            'records' => 'required|array',
            'records.*.uuid' => 'sometimes|string',
            'records.*.last_modified_at' => 'sometimes|date',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'data' => $validator->errors()
            ], 422);
        }

        try {
            $modelClass = $this->modelMap[$modelType];
            $deviceId = $request->input('device_id');
            $records = $request->input('records', []);

            // Add user context to records
            $userId = Auth::id();
            foreach ($records as &$record) {
                if (empty($record['created_by'])) {
                    $record['created_by'] = $userId;
                }
                $record['updated_by'] = $userId;
            }

            $results = SyncService::syncFromDevice($records, $modelClass, $deviceId);

            return response()->json([
                'status' => true,
                'message' => 'Sync completed successfully',
                'data' => $results
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Sync failed: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Get records from server for device sync
     *
     * @param Request $request
     * @param string $modelType
     * @return JsonResponse
     */
    public function syncFromServer(Request $request, string $modelType): JsonResponse
    {
        // Validate model type
        if (!isset($this->modelMap[$modelType])) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid model type',
                'data' => null
            ], 400);
        }

        // Validate request
        $validator = Validator::make($request->all(), [
            'device_id' => 'required|string',
            'last_sync_time' => 'sometimes|date',
            'farm_id' => 'sometimes|integer',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'data' => $validator->errors()
            ], 422);
        }

        try {
            $modelClass = $this->modelMap[$modelType];
            $deviceId = $request->input('device_id');
            $lastSyncTime = $request->input('last_sync_time')
                ? Carbon::parse($request->input('last_sync_time'))
                : null;

            // Get records for sync - filtered by user's farms if needed
            $query = $modelClass::query();

            // Filter by farm if specified
            if ($request->has('farm_id')) {
                $query->where('farm_id', $request->input('farm_id'));
            }

            // Filter by user's accessible records
            $userId = Auth::id();
            $query->where(function($q) use ($userId) {
                $q->where('created_by', $userId)
                  ->orWhere('updated_by', $userId);
            });

            // Apply sync filters
            if ($lastSyncTime) {
                $query->modifiedAfter($lastSyncTime);
            }

            // Exclude records from the same device
            $query->where(function($q) use ($deviceId) {
                $q->where('device_id', '!=', $deviceId)
                  ->orWhereNull('device_id');
            });

            $query->whereIn('sync_status', ['synced', 'conflict']);
            $query->withTrashed();

            $records = $query->get()->map(function($record) {
                return $record->toSyncPayload();
            });

            return response()->json([
                'status' => true,
                'message' => 'Records retrieved successfully',
                'data' => [
                    'records' => $records,
                    'sync_time' => now()->toISOString(),
                    'total_count' => $records->count()
                ]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to retrieve records: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Resolve conflicts for a specific model type
     *
     * @param Request $request
     * @param string $modelType
     * @return JsonResponse
     */
    public function resolveConflicts(Request $request, string $modelType): JsonResponse
    {
        if (!isset($this->modelMap[$modelType])) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid model type',
                'data' => null
            ], 400);
        }

        $validator = Validator::make($request->all(), [
            'strategy' => 'sometimes|in:last_write_wins,server_wins,client_wins',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'data' => $validator->errors()
            ], 422);
        }

        try {
            $modelClass = $this->modelMap[$modelType];
            $strategy = $request->input('strategy', 'last_write_wins');

            $results = SyncService::resolveConflicts($modelClass, $strategy);

            return response()->json([
                'status' => true,
                'message' => 'Conflicts resolved successfully',
                'data' => $results
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to resolve conflicts: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Get sync statistics
     *
     * @return JsonResponse
     */
    public function getSyncStatistics(): JsonResponse
    {
        try {
            $stats = SyncService::getSyncStatistics();

            return response()->json([
                'status' => true,
                'message' => 'Statistics retrieved successfully',
                'data' => $stats
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to retrieve statistics: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Bulk update sync status
     *
     * @param Request $request
     * @param string $modelType
     * @return JsonResponse
     */
    public function bulkUpdateSyncStatus(Request $request, string $modelType): JsonResponse
    {
        if (!isset($this->modelMap[$modelType])) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid model type',
                'data' => null
            ], 400);
        }

        $validator = Validator::make($request->all(), [
            'uuids' => 'required|array',
            'uuids.*' => 'string',
            'status' => 'required|in:pending,synced,conflict,deleted',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation failed',
                'data' => $validator->errors()
            ], 422);
        }

        try {
            $modelClass = $this->modelMap[$modelType];
            $uuids = $request->input('uuids');
            $status = $request->input('status');

            $updated = SyncService::bulkUpdateSyncStatus($modelClass, $uuids, $status);

            return response()->json([
                'status' => true,
                'message' => 'Sync status updated successfully',
                'data' => ['updated_count' => $updated]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to update sync status: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Generate missing UUIDs for existing records
     *
     * @param Request $request
     * @param string $modelType
     * @return JsonResponse
     */
    public function generateMissingUUIDs(Request $request, string $modelType): JsonResponse
    {
        if (!isset($this->modelMap[$modelType])) {
            return response()->json([
                'status' => false,
                'message' => 'Invalid model type',
                'data' => null
            ], 400);
        }

        try {
            $modelClass = $this->modelMap[$modelType];
            $updated = SyncService::generateMissingUUIDs($modelClass);

            return response()->json([
                'status' => true,
                'message' => 'UUIDs generated successfully',
                'data' => ['updated_count' => $updated]
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Failed to generate UUIDs: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }

    /**
     * Health check for sync system
     *
     * @return JsonResponse
     */
    public function healthCheck(): JsonResponse
    {
        try {
            $health = [
                'sync_service' => 'operational',
                'database' => 'connected',
                'timestamp' => now()->toISOString(),
                'supported_models' => array_keys($this->modelMap)
            ];

            return response()->json([
                'status' => true,
                'message' => 'Sync system is healthy',
                'data' => $health
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Sync system health check failed: ' . $e->getMessage(),
                'data' => null
            ], 500);
        }
    }
}
