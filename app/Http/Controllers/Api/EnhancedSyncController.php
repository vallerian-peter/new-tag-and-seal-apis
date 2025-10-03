<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Farm;
use App\Models\Livestock;
use App\Models\Vaccine;
use App\Models\Vaccination;
use App\Models\Medication;
use App\Models\Calving;
use App\Models\Deworming;
use App\Models\PregnancyDiagnosis;
use App\Models\Feeding;
use App\Models\Milking;
use App\Models\LivestockInsemination;
use App\Models\WeightGain;
use App\Models\DryingOff;
use App\Models\AnimalDisposal;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class EnhancedSyncController extends Controller
{
    /**
     * Model mapping for sync endpoints
     */
    private $modelMap = [
        'farms' => Farm::class,
        'livestocks' => Livestock::class,
        'vaccines' => Vaccine::class, // Added for vaccine inventory sync
        'vaccinations' => Vaccination::class,
        'medications' => Medication::class,
        'calvings' => Calving::class,
        'dewormings' => Deworming::class,
        'pregnancy_diagnosis' => PregnancyDiagnosis::class,
        'feedings' => Feeding::class,
        'milkings' => Milking::class,
        'inseminations' => LivestockInsemination::class,
        'weight_gains' => WeightGain::class,
        'drying_offs' => DryingOff::class,
        'animal_disposals' => AnimalDisposal::class,
    ];

    /**
     * Comprehensive sync method that handles multiple data types
     * This is the main endpoint the Flutter app will use
     */
    public function syncMultiple(Request $request)
    {
        try {
            // Check if this is a fetch request
            $action = $request->input('action', 'upload');

            if ($action === 'fetch') {
                return $this->handleFetchRequest($request);
            }

            // Validate upload request
            $validator = Validator::make($request->all(), [
                'device_id' => 'required|string',
                'farmer_no' => 'required|string',
                'data' => 'required|array',
                'data.farms' => 'sometimes|array',
                'data.livestocks' => 'sometimes|array',
                'data.vaccinations' => 'sometimes|array',
                'data.medications' => 'sometimes|array',
                'data.calvings' => 'sometimes|array',
                'data.dewormings' => 'sometimes|array',
                'data.pregnancy_diagnosis' => 'sometimes|array',
                'data.feedings' => 'sometimes|array',
                'data.milkings' => 'sometimes|array',
                'data.inseminations' => 'sometimes|array',
                'data.weight_gains' => 'sometimes|array',
                'data.drying_offs' => 'sometimes|array',
                'data.animal_disposals' => 'sometimes|array',
                // Farm validation rules
                'data.farms.*.uuid' => 'required|string',
                'data.farms.*.name' => 'required|string',
                'data.farms.*.reference_no' => 'required|string',
                'data.farms.*.size' => 'required|string',
                'data.farms.*.size_unit_id' => 'required|integer',
                'data.farms.*.region_id' => 'required|integer',
                'data.farms.*.district_id' => 'required|integer',
                'data.farms.*.ward_id' => 'required|integer',
                'data.farms.*.physical_address' => 'required|string',
                'data.farms.*.farm_status_id' => 'required|integer',
                'data.farms.*.created_by' => 'required|integer',
                // Livestock validation rules
                'data.livestocks.*.uuid' => 'required|string',
                'data.livestocks.*.identification_number' => 'required|string',
                'data.livestocks.*.dummy_tag_id' => 'nullable|string|max:255',
                'data.livestocks.*.barcode_tag_id' => 'nullable|string|max:255|unique:livestocks,barcode_tag_id',
                'data.livestocks.*.rfid_tag_id' => 'nullable|string|max:255|unique:livestocks,rfid_tag_id',
                'data.livestocks.*.name' => 'required|string',
                'data.livestocks.*.date_of_birth' => 'required|string',
                'data.livestocks.*.gender_id' => 'required|integer',
                'data.livestocks.*.breed_id' => 'required|integer',
                'data.livestocks.*.species_id' => 'required|integer',
                'data.livestocks.*.created_by' => 'required|integer',
                'data.livestocks.*.livestock_status_id' => 'required|integer',
                // Vaccine validation rules
                'data.vaccines.*.uuid' => 'required|string',
                'data.vaccines.*.name' => 'required|string',
                'data.vaccines.*.lot' => 'required|string',
                'data.vaccines.*.formulation_type' => 'required|string',
                'data.vaccines.*.dose' => 'required|string',
                'data.vaccines.*.farm_id' => 'required|integer',
                'data.vaccines.*.created_by' => 'nullable|integer',
                'data.vaccines.*.updated_by' => 'nullable|integer',
                'data.vaccines.*.vaccine_status_id' => 'nullable|integer',
                'data.vaccines.*.vaccine_type_id' => 'nullable|integer',
                'data.vaccines.*.vaccine_schedule_id' => 'nullable|integer',
                'data.vaccines.*.remote_id' => 'nullable|string',
                'data.vaccines.*.last_modified_at' => 'nullable|date',
                'data.vaccines.*.sync_status' => 'nullable|string',
                'data.vaccines.*.device_id' => 'nullable|string',
                'data.vaccines.*.original_created_at' => 'nullable|date',
                'data.vaccines.*.pending_action' => 'nullable|string',
                'data.vaccines.*.is_soft_deleted' => 'nullable|boolean',
                // Feeding validation rules
                'data.feedings.*.uuid' => 'required|string',
                'data.feedings.*.reference_no' => 'required|string',
                'data.feedings.*.farm_id' => 'required|integer',
                'data.feedings.*.livestock_id' => 'required|integer',
                'data.feedings.*.feeding_type_id' => 'required|integer',
                'data.feedings.*.feeding_time' => 'required|date',
                'data.feedings.*.remarks' => 'required|string',
                'data.feedings.*.created_by' => 'required|integer',
                'data.feedings.*.state_id' => 'required|integer',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 400);
            }

            $deviceId = $request->input('device_id');
            $farmerNo = $request->input('farmer_no');
            $data = $request->input('data', []);

            Log::info("Enhanced sync started", [
                'device_id' => $deviceId,
                'farmer_no' => $farmerNo,
                'data_types' => array_keys($data)
            ]);

            $results = [
                'farms' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'livestocks' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'vaccines' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'vaccinations' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'medications' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'calvings' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'dewormings' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'milkings' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'inseminations' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'weight_gains' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'drying_offs' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'animal_disposals' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'pregnancy_diagnosis' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
                'feedings' => ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0],
            ];

            DB::beginTransaction();

            // Process each data type
            foreach ($data as $dataType => $records) {
                if (isset($this->modelMap[$dataType]) && is_array($records)) {
                    $results[$dataType] = $this->processDataType($dataType, $records, $deviceId, $farmerNo);
                }
            }

            DB::commit();

            Log::info("Enhanced sync completed", [
                'device_id' => $deviceId,
                'farmer_no' => $farmerNo,
                'results' => $results
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Sync completed successfully',
                'data' => $results,
                'errors' => $this->getDetailedErrors($results)
            ]);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error("Enhanced sync failed", [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'status' => false,
                'message' => 'Sync failed: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Process a specific data type (farms, livestock, etc.)
     */
    private function processDataType($dataType, $records, $deviceId, $farmerNo)
    {
        $modelClass = $this->modelMap[$dataType];
        $results = ['created' => 0, 'updated' => 0, 'deleted' => 0, 'errors' => 0];

        foreach ($records as $recordData) {
            try {
                $action = $this->determineAction($recordData);
                Log::info("Processing record", [
                    'data_type' => $dataType,
                    'uuid' => $recordData['uuid'] ?? 'unknown',
                    'determined_action' => $action,
                    'pending_action' => $recordData['pending_action'] ?? $recordData['pendingAction'] ?? 'none',
                    'is_soft_deleted' => $recordData['is_soft_deleted'] ?? $recordData['isSoftDeleted'] ?? false,
                    'sync_status' => $recordData['sync_status'] ?? $recordData['syncStatus'] ?? 'unknown'
                ]);
                $result = $this->processRecord($modelClass, $recordData, $action, $deviceId, $farmerNo);

                if ($result['success']) {
                    $results[$result['action']]++;
                } else {
                    $results['errors']++;
                    Log::warning("Record processing failed", [
                        'data_type' => $dataType,
                        'uuid' => $recordData['uuid'] ?? 'unknown',
                        'error' => $result['error']
                    ]);
                }
            } catch (\Exception $e) {
                $results['errors']++;
                Log::error("Record processing exception", [
                    'data_type' => $dataType,
                    'uuid' => $recordData['uuid'] ?? 'unknown',
                    'error' => $e->getMessage()
                ]);
            }
        }

        return $results;
    }

    /**
     * Determine the action based on record data
     */
    private function determineAction($recordData)
    {
        // Check if it's a delete action (support both camelCase and snake_case)
        if ((isset($recordData['isSoftDeleted']) && $recordData['isSoftDeleted']) ||
            (isset($recordData['is_soft_deleted']) && $recordData['is_soft_deleted'])) {
            return 'delete';
        }

        // Check if it's a delete action via pendingAction (support both camelCase and snake_case)
        if ((isset($recordData['pendingAction']) && $recordData['pendingAction'] === 'delete') ||
            (isset($recordData['pending_action']) && $recordData['pending_action'] === 'delete')) {
            return 'delete';
        }

        // Check if it's an update action (support both camelCase and snake_case)
        if ((isset($recordData['pendingAction']) && $recordData['pendingAction'] === 'update') ||
            (isset($recordData['pending_action']) && $recordData['pending_action'] === 'update')) {
            return 'update';
        }

        // Check if it's a create action (support both camelCase and snake_case)
        if ((isset($recordData['pendingAction']) && $recordData['pendingAction'] === 'create') ||
            (isset($recordData['pending_action']) && $recordData['pending_action'] === 'create')) {
            return 'create';
        }

        // Check if record exists by UUID
        if (isset($recordData['uuid'])) {
            // This will be determined in processRecord
            return 'upsert';
        }

        // Default to create
        return 'create';
    }

    /**
     * Process a single record
     */
    private function processRecord($modelClass, $recordData, $action, $deviceId, $farmerNo)
    {
        try {
            // Ensure UUID exists
            if (empty($recordData['uuid'])) {
                $recordData['uuid'] = \Illuminate\Support\Str::uuid()->toString();
            }

            // Remove sync fields from recordData before saving to database
            // These fields are used for logic but not stored in DB
            $syncFields = ['sync_status', 'last_modified_at', 'device_id', 'original_created_at', 'is_soft_deleted', 'pending_action'];
            $dbRecordData = array_diff_key($recordData, array_flip($syncFields));

            // Handle different actions
            switch ($action) {
                case 'delete':
                    return $this->handleDelete($modelClass, $dbRecordData, $recordData);

                case 'update':
                    return $this->handleUpdate($modelClass, $dbRecordData, $recordData);

                case 'create':
                    return $this->handleCreate($modelClass, $dbRecordData, $recordData);

                case 'upsert':
                    return $this->handleUpsert($modelClass, $dbRecordData, $recordData);

                default:
                    return ['success' => false, 'error' => 'Unknown action: ' . $action];
            }
        } catch (\Exception $e) {
            return ['success' => false, 'error' => $e->getMessage()];
        }
    }

    /**
     * Handle delete action - hard delete using UUID and updated_at only
     */
    private function handleDelete($modelClass, $dbRecordData, $originalRecordData)
    {
        $existingRecord = $modelClass::where('uuid', $dbRecordData['uuid'])->first();

        if ($existingRecord) {
            // Always hard delete - no soft delete columns in database
            // Only uuid and updated_at are stored in database
            $existingRecord->forceDelete();

            Log::info("Record hard deleted", [
                'model' => $modelClass,
                'uuid' => $dbRecordData['uuid'],
                'deleted_at' => now()
            ]);

            return ['success' => true, 'action' => 'deleted'];
        }

        return ['success' => false, 'error' => 'Record not found for deletion'];
    }

    /**
     * Handle update action with timestamp conflict resolution
     */
    private function handleUpdate($modelClass, $dbRecordData, $originalRecordData)
    {
        $existingRecord = $modelClass::where('uuid', $dbRecordData['uuid'])->first();

        if ($existingRecord) {
            // Check for timestamp conflicts
            $localUpdatedAt = $originalRecordData['updated_at'] ?? null;
            $serverUpdatedAt = $existingRecord->updated_at;

            if ($localUpdatedAt && $serverUpdatedAt) {
                $localTime = \Carbon\Carbon::parse($localUpdatedAt);
                $serverTime = \Carbon\Carbon::parse($serverUpdatedAt);

                // If server is newer, don't update (conflict resolution)
                if ($serverTime->gt($localTime)) {
                    return [
                        'success' => false,
                        'error' => 'Server version is newer, skipping update',
                        'conflict' => true,
                        'server_updated_at' => $serverUpdatedAt,
                        'local_updated_at' => $localUpdatedAt
                    ];
                }
            }

            // Update existing record (sync fields are already removed from dbRecordData)
            $dbRecordData['updated_at'] = now();

            $existingRecord->update($dbRecordData);
            return ['success' => true, 'action' => 'updated'];
        }

        return ['success' => false, 'error' => 'Record not found for update'];
    }

    /**
     * Handle create action
     */
    private function handleCreate($modelClass, $dbRecordData, $originalRecordData)
    {
        // Check if record already exists
        $existingRecord = $modelClass::where('uuid', $dbRecordData['uuid'])->first();

        if ($existingRecord) {
            return ['success' => false, 'error' => 'Record already exists'];
        }

        // Create new record (sync fields are already removed from dbRecordData)
        $dbRecordData['created_at'] = now();
        $dbRecordData['updated_at'] = now();

        $modelClass::create($dbRecordData);
        return ['success' => true, 'action' => 'created'];
    }

    /**
     * Handle upsert (create or update) action with timestamp conflict resolution
     * This implements the core UUID-based sync pattern
     */
    private function handleUpsert($modelClass, $dbRecordData, $originalRecordData)
    {
        $existingRecord = $modelClass::where('uuid', $dbRecordData['uuid'])->first();

        if ($existingRecord) {
            // Case 2: Update (local → server) with conflict resolution
            $localUpdatedAt = $originalRecordData['updated_at'] ?? null;
            $serverUpdatedAt = $existingRecord->updated_at;

            if ($localUpdatedAt && $serverUpdatedAt) {
                $localTime = \Carbon\Carbon::parse($localUpdatedAt);
                $serverTime = \Carbon\Carbon::parse($serverUpdatedAt);

                // If server is newer, don't update (conflict resolution)
                if ($serverTime->gt($localTime)) {
                    return [
                        'success' => false,
                        'error' => 'Server version is newer, skipping update',
                        'conflict' => true,
                        'server_updated_at' => $serverUpdatedAt,
                        'local_updated_at' => $localUpdatedAt
                    ];
                }
            }

            // Update existing record (sync fields are already removed from dbRecordData)
            $dbRecordData['updated_at'] = now();
            $existingRecord->update($dbRecordData);
            return ['success' => true, 'action' => 'updated'];
        } else {
            // Case 1: Insert (local → server) - new record
            $dbRecordData['created_at'] = now();
            $dbRecordData['updated_at'] = now();

            $modelClass::create($dbRecordData);
            return ['success' => true, 'action' => 'created'];
        }
    }

    /**
     * Fetch data from server with UUID-based conflict resolution
     * This implements the "Server → Local" sync pattern
     */
    public function fetchData(Request $request)
    {
        try {
            // Validate request
            $validator = Validator::make($request->all(), [
                'device_id' => 'required|string',
                'farmer_no' => 'required|string',
                'last_sync_timestamp' => 'required|date',
                'data_types' => 'sometimes|array',
                'data_types.*' => 'string|in:' . implode(',', array_keys($this->modelMap))
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors()
                ], 400);
            }

            $deviceId = $request->input('device_id');
            $farmerNo = $request->input('farmer_no');
            $lastSyncTimestamp = $request->input('last_sync_timestamp');
            $dataTypes = $request->input('data_types', array_keys($this->modelMap));

            Log::info("Enhanced fetch started", [
                'device_id' => $deviceId,
                'farmer_no' => $farmerNo,
                'last_sync_timestamp' => $lastSyncTimestamp,
                'data_types' => $dataTypes
            ]);

            $results = [];
            $totalRecords = 0;

            foreach ($dataTypes as $dataType) {
                if (!isset($this->modelMap[$dataType])) {
                    continue;
                }

                $modelClass = $this->modelMap[$dataType];
                $model = new $modelClass;

                try {
                    // Fetch records updated after last sync timestamp
                    $query = $model->where('updated_at', '>', $lastSyncTimestamp);

                    // Add farmer-specific filtering if applicable
                    if (method_exists($model, 'scopeForFarmer')) {
                        $query = $query->forFarmer($farmerNo);
                    }

                    $records = $query->get();
                    $totalRecords += $records->count();

                    $results[$dataType] = [
                        'count' => $records->count(),
                        'records' => $records->toArray(),
                        'success' => true
                    ];

                    Log::info("Fetched {$dataType} records", [
                        'count' => $records->count(),
                        'last_sync_timestamp' => $lastSyncTimestamp
                    ]);

                } catch (\Exception $e) {
                    Log::error("Error fetching {$dataType} records", [
                        'error' => $e->getMessage(),
                        'trace' => $e->getTraceAsString()
                    ]);

                    $results[$dataType] = [
                        'count' => 0,
                        'records' => [],
                        'success' => false,
                        'error' => $e->getMessage()
                    ];
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Fetch completed successfully',
                'data' => $results,
                'summary' => [
                    'total_records' => $totalRecords,
                    'data_types_processed' => count($dataTypes),
                    'last_sync_timestamp' => $lastSyncTimestamp,
                    'current_timestamp' => now()->toISOString()
                ]
            ]);

        } catch (\Exception $e) {
            Log::error('Enhanced fetch failed', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'status' => false,
                'message' => 'Fetch failed: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Get sync statistics
     */
    public function getStatistics(Request $request)
    {
        try {
            $deviceId = $request->input('device_id');
            $farmerNo = $request->input('farmer_no');

            $stats = [];
            foreach ($this->modelMap as $dataType => $modelClass) {
                $stats[$dataType] = $this->getModelStats($modelClass, $deviceId, $farmerNo);
            }

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
     * Get statistics for a specific model
     */
    private function getModelStats($modelClass, $deviceId = null, $farmerNo = null)
    {
        try {
            $query = $modelClass::query();

            // Filter by farmer if applicable
            if ($farmerNo && method_exists($modelClass, 'scopeForFarmer')) {
                $query->forFarmer($farmerNo);
            }

            $total = $query->count();

            // Since sync fields are not in database, we can only provide basic stats
            // The sync status tracking happens in the frontend/local storage
            return [
                'total' => $total,
                'pending' => 0, // Not tracked in DB
                'synced' => $total, // All records in DB are considered synced
                'conflicts' => 0, // Not tracked in DB
                'deleted' => 0, // Not tracked in DB (deleted records are actually deleted)
                'device_records' => 0 // Not tracked in DB
            ];
        } catch (\Exception $e) {
            return [
                'error' => 'Failed to get stats: ' . $e->getMessage()
            ];
        }
    }

    /**
     * Get detailed errors from results
     */
    private function getDetailedErrors($results)
    {
        $errors = [];
        foreach ($results as $dataType => $result) {
            if ($result['errors'] > 0) {
                $errors[$dataType] = "{$result['errors']} errors occurred during processing";
            }
        }
        return $errors;
    }

    /**
     * Health check endpoint
     */
    public function healthCheck()
    {
        try {
            // Test database connection
            DB::connection()->getPdo();

            $info = [
                'status' => 'healthy',
                'timestamp' => now()->toIso8601String(),
                'database' => 'connected',
                'supported_models' => array_keys($this->modelMap),
                'version' => '2.0.0'
            ];

            return response()->json([
                'status' => true,
                'message' => 'Enhanced sync service is healthy',
                'data' => $info
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Enhanced sync service is unhealthy: ' . $e->getMessage()
            ], 500);
        }
    }

    /**
     * Handle fetch request - return server data for client sync
     */
    private function handleFetchRequest(Request $request)
    {
        try {
            // Validate fetch request
            $validator = Validator::make($request->all(), [
                'device_id' => 'required|string',
                'farmer_no' => 'required|string',
                'action' => 'required|string|in:fetch',
                'last_sync_timestamp' => 'nullable|string',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Validation failed',
                    'errors' => $validator->errors(),
                ], 400);
            }

            $deviceId = $request->input('device_id');
            $farmerNo = $request->input('farmer_no');
            $lastSyncTimestamp = $request->input('last_sync_timestamp');

            Log::info("Fetch request received", [
                'device_id' => $deviceId,
                'farmer_no' => $farmerNo,
                'last_sync_timestamp' => $lastSyncTimestamp,
            ]);

            // Get server data for all data types
            $serverData = [];

            // Fetch farms
            $farms = $this->fetchFarms($farmerNo, $lastSyncTimestamp);
            if (!empty($farms)) {
                $serverData['farms'] = $farms;
            }

            // Fetch livestock
            $livestock = $this->fetchLivestock($farmerNo, $lastSyncTimestamp);
            if (!empty($livestock)) {
                $serverData['livestocks'] = $livestock;
            }

            // Fetch vaccines
            $vaccines = $this->fetchVaccines($farmerNo, $lastSyncTimestamp);
            if (!empty($vaccines)) {
                $serverData['vaccines'] = $vaccines;
            }

            // Fetch logs
            $logs = $this->fetchLogs($farmerNo, $lastSyncTimestamp);
            $serverData = array_merge($serverData, $logs);

            Log::info("Fetch completed", [
                'data_types' => array_keys($serverData),
                'total_records' => array_sum(array_map('count', $serverData)),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Fetch completed successfully',
                'data' => $serverData,
            ]);

        } catch (\Exception $e) {
            Log::error("Fetch request failed", [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);

            return response()->json([
                'status' => false,
                'message' => 'Fetch failed: ' . $e->getMessage(),
                'data' => null,
            ], 500);
        }
    }

    /**
     * Fetch farms from server
     */
    private function fetchFarms($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Farm::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($farm) {
                return [
                    'uuid' => $farm->uuid,
                    'name' => $farm->name,
                    'reference_no' => $farm->reference_no,
                    'size' => $farm->size,
                    'size_unit_id' => $farm->size_unit_id,
                    'physical_address' => $farm->physical_address,
                    'regional_registration_number' => $farm->regional_registration_number,
                    'legal_status_id' => $farm->legal_status_id,
                    'gps' => $farm->gps,
                    'district_id' => $farm->district_id,
                    'region_id' => $farm->region_id,
                    'ward_id' => $farm->ward_id,
                    'country_id' => $farm->country_id,
                    'created_by' => $farm->created_by,
                    'farm_status_id' => $farm->farm_status_id,
                    'created_at' => $farm->created_at,
                    'updated_at' => $farm->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching farms", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch livestock from server
     */
    private function fetchLivestock($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Livestock::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($livestock) {
                return [
                    'uuid' => $livestock->uuid,
                    'identification_number' => $livestock->identification_number,
                    'dummy_tag_id' => $livestock->dummy_tag_id,
                    'barcode_tag_id' => $livestock->barcode_tag_id,
                    'rfid_tag_id' => $livestock->rfid_tag_id,
                    'name' => $livestock->name,
                    'date_of_birth' => $livestock->date_of_birth,
                    'mother_id' => $livestock->mother_id,
                    'father_id' => $livestock->father_id,
                    'gender_id' => $livestock->gender_id,
                    'breed_id' => $livestock->breed_id,
                    'species_id' => $livestock->species_id,
                    'created_by' => $livestock->created_by,
                    'livestock_status_id' => $livestock->livestock_status_id,
                    'created_at' => $livestock->created_at,
                    'updated_at' => $livestock->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching livestock", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch vaccines from server
     */
    private function fetchVaccines($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Vaccine::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($vaccine) {
                return [
                    'uuid' => $vaccine->uuid,
                    'name' => $vaccine->name,
                    'lot' => $vaccine->lot,
                    'formulation_type' => $vaccine->formulation_type,
                    'dose' => $vaccine->dose,
                    'farm_id' => $vaccine->farm_id,
                    'created_by' => $vaccine->created_by,
                    'updated_by' => $vaccine->updated_by,
                    'vaccine_status_id' => $vaccine->vaccine_status_id,
                    'vaccine_type_id' => $vaccine->vaccine_type_id,
                    'vaccine_schedule_id' => $vaccine->vaccine_schedule_id,
                    'created_at' => $vaccine->created_at,
                    'updated_at' => $vaccine->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching vaccines", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch all log types from server
     */
    private function fetchLogs($farmerNo, $lastSyncTimestamp = null)
    {
        $logs = [];

        try {
            // Fetch vaccination logs
            $vaccinationLogs = $this->fetchVaccinationLogs($farmerNo, $lastSyncTimestamp);
            if (!empty($vaccinationLogs)) {
                $logs['vaccinations'] = $vaccinationLogs;
            }

            // Fetch medication logs
            $medicationLogs = $this->fetchMedicationLogs($farmerNo, $lastSyncTimestamp);
            if (!empty($medicationLogs)) {
                $logs['medications'] = $medicationLogs;
            }

            // Fetch feeding logs
            $feedingLogs = $this->fetchFeedingLogs($farmerNo, $lastSyncTimestamp);
            if (!empty($feedingLogs)) {
                $logs['feedings'] = $feedingLogs;
            }

            // Fetch milking logs
            $milkingLogs = $this->fetchMilkingLogs($farmerNo, $lastSyncTimestamp);
            if (!empty($milkingLogs)) {
                $logs['milkings'] = $milkingLogs;
            }

            // Add other log types as needed...

        } catch (\Exception $e) {
            Log::error("Error fetching logs", ['error' => $e->getMessage()]);
        }

        return $logs;
    }

    /**
     * Fetch vaccination logs from server
     */
    private function fetchVaccinationLogs($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Vaccination::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($log) {
                return [
                    'uuid' => $log->uuid,
                    'serial' => $log->serial,
                    'livestock_id' => $log->livestock_id,
                    'disease_id' => $log->disease_id,
                    'vaccine_id' => $log->vaccine_id,
                    'batch_no' => $log->batch_no,
                    'quantity' => $log->quantity,
                    'administration_route' => $log->administration_route,
                    'rate' => $log->rate,
                    'vet_id' => $log->vet_id,
                    'officer_id' => $log->officer_id,
                    'next_vaccination_date' => $log->next_vaccination_date,
                    'remarks' => $log->remarks,
                    'vaccination_date' => $log->vaccination_date,
                    'reference_no' => $log->reference_no,
                    'farm_id' => $log->farm_id,
                    'created_by' => $log->created_by,
                    'created_at' => $log->created_at,
                    'updated_at' => $log->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching vaccination logs", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch medication logs from server
     */
    private function fetchMedicationLogs($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Medication::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($log) {
                return [
                    'uuid' => $log->uuid,
                    'serial' => $log->serial,
                    'disease_id' => $log->disease_id,
                    'medicine_id' => $log->medicine_id,
                    'quantity' => $log->quantity,
                    'quantity_unit' => $log->quantity_unit,
                    'withdrawal_period' => $log->withdrawal_period,
                    'withdrawal_period_unit_id' => $log->withdrawal_period_unit_id,
                    'vet_id' => $log->vet_id,
                    'remarks' => $log->remarks,
                    'medication_date' => $log->medication_date,
                    'reference_no' => $log->reference_no,
                    'livestock_id' => $log->livestock_id,
                    'farm_id' => $log->farm_id,
                    'created_by' => $log->created_by,
                    'created_at' => $log->created_at,
                    'updated_at' => $log->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching medication logs", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch feeding logs from server
     */
    private function fetchFeedingLogs($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Feeding::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($log) {
                return [
                    'uuid' => $log->uuid,
                    'reference_no' => $log->reference_no,
                    'farm_id' => $log->farm_id,
                    'livestock_id' => $log->livestock_id,
                    'feeding_type_id' => $log->feeding_type_id,
                    'amount' => $log->amount,
                    'remarks' => $log->remarks,
                    'feeding_time' => $log->feeding_time,
                    'created_by' => $log->created_by,
                    'state_id' => $log->state_id,
                    'created_at' => $log->created_at,
                    'updated_at' => $log->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching feeding logs", ['error' => $e->getMessage()]);
            return [];
        }
    }

    /**
     * Fetch milking logs from server
     */
    private function fetchMilkingLogs($farmerNo, $lastSyncTimestamp = null)
    {
        try {
            $query = Milking::where('created_by', $farmerNo);

            if ($lastSyncTimestamp) {
                $query->where('updated_at', '>', $lastSyncTimestamp);
            }

            return $query->get()->map(function ($log) {
                return [
                    'uuid' => $log->uuid,
                    'milking_method_id' => $log->milking_method_id,
                    'milking_session_id' => $log->milking_session_id,
                    'amount' => $log->amount,
                    'milking_unit_id' => $log->milking_unit_id,
                    'lactometer_reading' => $log->lactometer_reading,
                    'solid' => $log->solid,
                    'solid_non_fat' => $log->solid_non_fat,
                    'total_solids' => $log->total_solids,
                    'protein' => $log->protein,
                    'corrected_lactometer_reading' => $log->corrected_lactometer_reading,
                    'colony_forming_units' => $log->colony_forming_units,
                    'acidity' => $log->acidity,
                    'milking_status_id' => $log->milking_status_id,
                    'reference_no' => $log->reference_no,
                    'livestock_id' => $log->livestock_id,
                    'created_by' => $log->created_by,
                    'created_at' => $log->created_at,
                    'updated_at' => $log->updated_at,
                ];
            })->toArray();
        } catch (\Exception $e) {
            Log::error("Error fetching milking logs", ['error' => $e->getMessage()]);
            return [];
        }
    }
}
