<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\SyncController;
use App\Http\Controllers\Api\ComprehensiveSyncController;
use App\Http\Controllers\Api\EnhancedSyncController;

/*
|--------------------------------------------------------------------------
| Sync API Routes
|--------------------------------------------------------------------------
|
| These routes handle synchronization between mobile devices and server
| for livestock event logs and other critical data.
|
*/

Route::middleware(['auth:sanctum'])->group(function () {

    // Health check for sync system
    Route::get('/sync/health', [SyncController::class, 'healthCheck']);

    // Get sync statistics
    Route::get('/sync/statistics', [SyncController::class, 'getSyncStatistics']);

    // Model-specific sync routes
    Route::prefix('sync/{modelType}')->group(function () {

        // Upload records from device to server
        Route::post('/upload', [SyncController::class, 'syncToServer']);

        // Download records from server to device
        Route::post('/download', [SyncController::class, 'syncFromServer']);

        // Resolve conflicts
        Route::post('/resolve-conflicts', [SyncController::class, 'resolveConflicts']);

        // Bulk update sync status
        Route::patch('/sync-status', [SyncController::class, 'bulkUpdateSyncStatus']);

        // Generate missing UUIDs
        Route::post('/generate-uuids', [SyncController::class, 'generateMissingUUIDs']);
    });

    // Batch sync operations for multiple model types
    Route::prefix('sync/batch')->group(function () {

        // Upload multiple model types at once
        Route::post('/upload', function(\Illuminate\Http\Request $request) {
            $results = [];
            $models = $request->input('models', []);

            foreach ($models as $modelType => $data) {
                try {
                    $syncController = new SyncController();
                    $request->merge($data);
                    $result = $syncController->syncToServer($request, $modelType);
                    $results[$modelType] = json_decode($result->getContent(), true);
                } catch (\Exception $e) {
                    $results[$modelType] = [
                        'status' => false,
                        'message' => $e->getMessage()
                    ];
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Batch sync completed',
                'data' => $results
            ]);
        });

        // Download multiple model types at once
        Route::post('/download', function(\Illuminate\Http\Request $request) {
            $results = [];
            $modelTypes = $request->input('model_types', []);

            foreach ($modelTypes as $modelType) {
                try {
                    $syncController = new SyncController();
                    $result = $syncController->syncFromServer($request, $modelType);
                    $results[$modelType] = json_decode($result->getContent(), true);
                } catch (\Exception $e) {
                    $results[$modelType] = [
                        'status' => false,
                        'message' => $e->getMessage()
                    ];
                }
            }

            return response()->json([
                'status' => true,
                'message' => 'Batch download completed',
                'data' => $results
            ]);
        });
    });

    // Comprehensive sync endpoints (for Flutter UUID-based sync)
    Route::prefix('sync/comprehensive')->group(function () {
        Route::post('/upload', [ComprehensiveSyncController::class, 'upload']);
        Route::post('/download', [ComprehensiveSyncController::class, 'download']);
        Route::get('/statistics', [ComprehensiveSyncController::class, 'getStatistics']);
        Route::post('/resolve-conflicts', [ComprehensiveSyncController::class, 'resolveConflicts']);
        Route::get('/health', [ComprehensiveSyncController::class, 'healthCheck']);
    });

    // Enhanced sync endpoints (for Flutter comprehensive sync with farms and livestock)
    Route::prefix('sync/enhanced')->group(function () {
        Route::post('/sync-multiple', [EnhancedSyncController::class, 'syncMultiple']);
        Route::post('/fetch-data', [EnhancedSyncController::class, 'fetchData']);
        Route::get('/statistics', [EnhancedSyncController::class, 'getStatistics']);
        Route::get('/health', [EnhancedSyncController::class, 'healthCheck']);
    });
});

// Public endpoints for testing (no authentication required)
Route::prefix('sync/public')->group(function () {
    Route::get('/health', [ComprehensiveSyncController::class, 'healthCheck']);
    Route::get('/statistics', [ComprehensiveSyncController::class, 'getStatistics']);
    Route::post('/upload', [ComprehensiveSyncController::class, 'upload']);
    Route::post('/download', [ComprehensiveSyncController::class, 'download']);
Route::post('/resolve-conflicts', [ComprehensiveSyncController::class, 'resolveConflicts']);

    // Enhanced sync public endpoints for testing
    Route::get('/enhanced/health', [EnhancedSyncController::class, 'healthCheck']);
    Route::get('/enhanced/statistics', [EnhancedSyncController::class, 'getStatistics']);
    Route::post('/enhanced/sync-multiple', [EnhancedSyncController::class, 'syncMultiple']);
    Route::post('/enhanced/fetch-data', [EnhancedSyncController::class, 'fetchData']);
});

// Legacy sync endpoints (for backward compatibility)
Route::middleware(['auth:sanctum'])->group(function () {

    // Legacy vaccination sync
    Route::post('/farmer/sync/vaccinations', function(\Illuminate\Http\Request $request) {
        $syncController = new SyncController();
        return $syncController->syncToServer($request, 'vaccinations');
    });

    // Legacy medication sync
    Route::post('/farmer/sync/medications', function(\Illuminate\Http\Request $request) {
        $syncController = new SyncController();
        return $syncController->syncToServer($request, 'medications');
    });

    // Legacy calving sync
    Route::post('/farmer/sync/calvings', function(\Illuminate\Http\Request $request) {
        $syncController = new SyncController();
        return $syncController->syncToServer($request, 'calvings');
    });

    // Legacy deworming sync
    Route::post('/farmer/sync/dewormings', function(\Illuminate\Http\Request $request) {
        $syncController = new SyncController();
        return $syncController->syncToServer($request, 'dewormings');
    });

    // Legacy pregnancy diagnosis sync
    Route::post('/farmer/sync/pregnancy-diagnosis', function(\Illuminate\Http\Request $request) {
        $syncController = new SyncController();
        return $syncController->syncToServer($request, 'pregnancy_diagnosis');
    });
});
