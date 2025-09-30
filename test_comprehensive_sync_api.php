<?php

/**
 * Comprehensive Sync API Test Script
 * 
 * This script tests all the sync API endpoints to ensure they work correctly
 * with the UUID-based synchronization system.
 */

require_once 'vendor/autoload.php';

// Bootstrap Laravel application
$app = require_once 'bootstrap/app.php';
$app->make('Illuminate\Contracts\Console\Kernel')->bootstrap();

use Illuminate\Http\Request;
use App\Http\Controllers\Api\ComprehensiveSyncController;
use App\Models\Vaccination;
use App\Models\Medication;

class SyncApiTester
{
    private $controller;
    private $testDeviceId;
    private $testUuids = [];

    public function __construct()
    {
        $this->controller = new ComprehensiveSyncController(new \App\Services\SyncService());
        $this->testDeviceId = 'test_device_' . uniqid();
        
        echo "🧪 Comprehensive Sync API Test Suite\n";
        echo "=====================================\n\n";
        echo "Test Device ID: {$this->testDeviceId}\n\n";
    }

    public function runAllTests()
    {
        $this->testHealthCheck();
        $this->testCreateTestData();
        $this->testUploadEndpoint();
        $this->testDownloadEndpoint();
        $this->testStatistics();
        $this->testConflictResolution();
        $this->testCleanup();
        
        echo "\n🎉 All tests completed!\n";
    }

    private function testHealthCheck()
    {
        echo "🔍 Testing Health Check Endpoint...\n";
        
        try {
            $response = $this->controller->healthCheck();
            $responseData = json_decode($response->getContent(), true);
            
            if ($responseData['status'] === true) {
                echo "  ✅ Health check passed\n";
                echo "  📊 Supported tables: " . implode(', ', $responseData['data']['supported_tables']) . "\n";
            } else {
                echo "  ❌ Health check failed\n";
            }
        } catch (Exception $e) {
            echo "  ❌ Health check error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testCreateTestData()
    {
        echo "📝 Creating Test Data...\n";
        
        try {
            // Create test vaccination record
            $vaccination = Vaccination::create([
                'uuid' => $this->generateTestUuid(),
                'vaccination_no' => 'TEST_VAC_' . uniqid(),
                'farm_id' => 1,
                'livestock_id' => 1,
                'vaccine_id' => 1,
                'disease_id' => 1,
                'vet_id' => 1,
                'extension_officer_id' => 1,
                'created_by' => 1,
                'vaccination_status_id' => 1,
                'device_id' => $this->testDeviceId,
                'sync_status' => 'pending',
                'last_modified_at' => now(),
                'original_created_at' => now(),
            ]);
            
            $this->testUuids['vaccination'] = $vaccination->uuid;
            echo "  ✅ Created test vaccination record: {$vaccination->uuid}\n";
            
            // Create test medication record
            $medication = Medication::create([
                'uuid' => $this->generateTestUuid(),
                'farm_id' => 1,
                'livestock_id' => 1,
                'disease_id' => 1,
                'medicine_id' => 1,
                'quantity' => 10,
                'quantity_unit_id' => 1,
                'withdrawal_period' => 7,
                'withdrawal_period_unit_id' => 1,
                'medication_date' => now(),
                'remarks' => 'Test medication',
                'vet_id' => 1,
                'created_by' => 1,
                'updated_by' => 1,
                'state_id' => 1,
                'device_id' => $this->testDeviceId,
                'sync_status' => 'pending',
                'last_modified_at' => now(),
                'original_created_at' => now(),
            ]);
            
            $this->testUuids['medication'] = $medication->uuid;
            echo "  ✅ Created test medication record: {$medication->uuid}\n";
            
        } catch (Exception $e) {
            echo "  ❌ Failed to create test data: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testUploadEndpoint()
    {
        echo "⬆️  Testing Upload Endpoint...\n";
        
        try {
            // Test vaccination upload
            $request = $this->createRequest([
                'table_name' => 'vaccinations',
                'device_id' => $this->testDeviceId,
                'records' => [
                    [
                        'uuid' => $this->generateTestUuid(),
                        'vaccination_no' => 'UPLOAD_TEST_' . uniqid(),
                        'farm_id' => 1,
                        'livestock_id' => 1,
                        'vaccine_id' => 1,
                        'disease_id' => 1,
                        'vet_id' => 1,
                        'extension_officer_id' => 1,
                        'created_by' => 1,
                        'vaccination_status_id' => 1,
                        'last_modified_at' => now()->toIso8601String(),
                    ]
                ]
            ]);

            $response = $this->controller->upload($request);
            $responseData = json_decode($response->getContent(), true);
            
            if ($responseData['status'] === true) {
                echo "  ✅ Upload successful\n";
                echo "  📊 Uploaded: {$responseData['data']['uploaded']}\n";
                echo "  📊 Conflicts: {$responseData['data']['conflicts']}\n";
                echo "  📊 Errors: {$responseData['data']['errors']}\n";
            } else {
                echo "  ❌ Upload failed: " . $responseData['message'] . "\n";
            }
            
        } catch (Exception $e) {
            echo "  ❌ Upload test error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testDownloadEndpoint()
    {
        echo "⬇️  Testing Download Endpoint...\n";
        
        try {
            $request = $this->createRequest([
                'table_name' => 'vaccinations',
                'device_id' => 'different_device_' . uniqid(),
                'last_sync_time' => now()->subHour()->toIso8601String(),
            ]);

            $response = $this->controller->download($request);
            $responseData = json_decode($response->getContent(), true);
            
            if ($responseData['status'] === true) {
                echo "  ✅ Download successful\n";
                echo "  📊 Records: {$responseData['data']['count']}\n";
            } else {
                echo "  ❌ Download failed: " . $responseData['message'] . "\n";
            }
            
        } catch (Exception $e) {
            echo "  ❌ Download test error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testStatistics()
    {
        echo "📊 Testing Statistics Endpoint...\n";
        
        try {
            $request = $this->createRequest([
                'device_id' => $this->testDeviceId,
            ]);

            $response = $this->controller->getStatistics($request);
            $responseData = json_decode($response->getContent(), true);
            
            if ($responseData['status'] === true) {
                echo "  ✅ Statistics retrieved successfully\n";
                
                foreach ($responseData['data'] as $table => $stats) {
                    if (!isset($stats['error'])) {
                        echo "  📊 {$table}: Total={$stats['total']}, Pending={$stats['pending']}, Synced={$stats['synced']}\n";
                    }
                }
            } else {
                echo "  ❌ Statistics failed: " . $responseData['message'] . "\n";
            }
            
        } catch (Exception $e) {
            echo "  ❌ Statistics test error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testConflictResolution()
    {
        echo "🔄 Testing Conflict Resolution...\n";
        
        try {
            // Create a conflict by marking a record as conflicted
            if (isset($this->testUuids['vaccination'])) {
                $vaccination = Vaccination::where('uuid', $this->testUuids['vaccination'])->first();
                if ($vaccination) {
                    $vaccination->update(['sync_status' => 'conflict']);
                    echo "  📝 Created test conflict for vaccination: {$vaccination->uuid}\n";
                }
            }

            $request = $this->createRequest([
                'table_name' => 'vaccinations',
                'strategy' => 'last_write_wins',
            ]);

            $response = $this->controller->resolveConflicts($request);
            $responseData = json_decode($response->getContent(), true);
            
            if ($responseData['status'] === true) {
                echo "  ✅ Conflict resolution successful\n";
                echo "  📊 Resolved: {$responseData['data']['resolved']}\n";
            } else {
                echo "  ❌ Conflict resolution failed: " . $responseData['message'] . "\n";
            }
            
        } catch (Exception $e) {
            echo "  ❌ Conflict resolution test error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function testCleanup()
    {
        echo "🧹 Cleaning up test data...\n";
        
        try {
            // Clean up test records
            Vaccination::where('device_id', $this->testDeviceId)->forceDelete();
            Medication::where('device_id', $this->testDeviceId)->forceDelete();
            
            echo "  ✅ Test data cleaned up\n";
            
        } catch (Exception $e) {
            echo "  ❌ Cleanup error: " . $e->getMessage() . "\n";
        }
        
        echo "\n";
    }

    private function createRequest(array $data)
    {
        $request = new Request();
        $request->merge($data);
        return $request;
    }

    private function generateTestUuid()
    {
        return sprintf(
            '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }
}

// Run the tests
try {
    $tester = new SyncApiTester();
    $tester->runAllTests();
} catch (Exception $e) {
    echo "💥 Test suite failed: " . $e->getMessage() . "\n";
    echo "Stack trace:\n" . $e->getTraceAsString() . "\n";
}
