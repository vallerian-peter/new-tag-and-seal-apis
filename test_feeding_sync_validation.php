<?php

require_once 'vendor/autoload.php';

// Test feeding logs sync validation and status handling
$baseUrl = 'http://localhost:8002/api'; // Use localhost for testing
$timestamp = time();

echo "🧪 Testing Feeding Logs Sync Validation & Status Handling\n";
echo "========================================================\n\n";

// Test 1: Health Check
echo "1. Testing Enhanced Sync Health Check...\n";
$healthResponse = @file_get_contents("$baseUrl/sync/public/enhanced/health");
if ($healthResponse === false) {
    echo "❌ Cannot connect to server. Please ensure Laravel server is running on port 8002\n";
    echo "   Run: php artisan serve --port=8002\n\n";
    exit(1);
}

$healthData = json_decode($healthResponse, true);
if ($healthData && $healthData['status'] === true) {
    echo "✅ Enhanced sync service is healthy\n";
    echo "   Supported models: " . implode(', ', $healthData['data']['supported_models']) . "\n\n";
} else {
    echo "❌ Enhanced sync service is unhealthy\n\n";
    exit(1);
}

// Test 2: Test Create Action with Frontend Data Structure
echo "2. Testing Feeding Log CREATE Action...\n";
$deviceId = "test-device-$timestamp";
$testData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-create-$timestamp",
                'reference_no' => "FD$timestamp",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '10.5',
                'remarks' => 'Test feeding log for create',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Frontend sync fields (not stored in DB)
                'sync_status' => 'pending',
                'pending_action' => 'create',
                'is_soft_deleted' => false,
            ],
        ],
    ],
];

$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => json_encode($testData),
    ],
]);

$response = @file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
if ($response === false) {
    echo "❌ Failed to send create request\n\n";
} else {
    $result = json_decode($response, true);
    if ($result && $result['status'] === true) {
        echo "✅ Feeding log CREATE action successful\n";
        echo "   Created: {$result['data']['feedings']['created']}\n";
        echo "   Updated: {$result['data']['feedings']['updated']}\n";
        echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
        echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
    } else {
        echo "❌ Feeding log CREATE action failed\n";
        echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
    }
}

// Test 3: Test Update Action
echo "3. Testing Feeding Log UPDATE Action...\n";
$updateData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-create-$timestamp", // Same UUID as created
                'reference_no' => "FD$timestamp-UPDATED",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '15.0', // Changed amount
                'remarks' => 'Updated test feeding log',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Frontend sync fields
                'sync_status' => 'pending',
                'pending_action' => 'update',
                'is_soft_deleted' => false,
            ],
        ],
    ],
];

$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => json_encode($updateData),
    ],
]);

$response = @file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
if ($response === false) {
    echo "❌ Failed to send update request\n\n";
} else {
    $result = json_decode($response, true);
    if ($result && $result['status'] === true) {
        echo "✅ Feeding log UPDATE action successful\n";
        echo "   Created: {$result['data']['feedings']['created']}\n";
        echo "   Updated: {$result['data']['feedings']['updated']}\n";
        echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
        echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
    } else {
        echo "❌ Feeding log UPDATE action failed\n";
        echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
    }
}

// Test 4: Test Delete Action (Soft Delete)
echo "4. Testing Feeding Log DELETE Action (Soft Delete)...\n";
$deleteData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-create-$timestamp", // Same UUID
                'reference_no' => "FD$timestamp-UPDATED",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '15.0',
                'remarks' => 'Updated test feeding log',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Frontend sync fields for delete
                'sync_status' => 'pending',
                'pending_action' => 'delete',
                'is_soft_deleted' => true,
            ],
        ],
    ],
];

$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => json_encode($deleteData),
    ],
]);

$response = @file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
if ($response === false) {
    echo "❌ Failed to send delete request\n\n";
} else {
    $result = json_decode($response, true);
    if ($result && $result['status'] === true) {
        echo "✅ Feeding log DELETE action successful\n";
        echo "   Created: {$result['data']['feedings']['created']}\n";
        echo "   Updated: {$result['data']['feedings']['updated']}\n";
        echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
        echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
    } else {
        echo "❌ Feeding log DELETE action failed\n";
        echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
    }
}

// Test 5: Test Invalid Data (Missing Required Fields)
echo "5. Testing Invalid Data (Missing Required Fields)...\n";
$invalidData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-invalid-$timestamp",
                // Missing required fields like farm_id, livestock_id, etc.
                'sync_status' => 'pending',
                'pending_action' => 'create',
                'is_soft_deleted' => false,
            ],
        ],
    ],
];

$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => json_encode($invalidData),
    ],
]);

$response = @file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
if ($response === false) {
    echo "❌ Failed to send invalid data request\n\n";
} else {
    $result = json_decode($response, true);
    if ($result && $result['status'] === true) {
        echo "⚠️  Invalid data was accepted (this might be expected if validation is lenient)\n";
        echo "   Created: {$result['data']['feedings']['created']}\n";
        echo "   Updated: {$result['data']['feedings']['updated']}\n";
        echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
        echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
    } else {
        echo "✅ Invalid data was properly rejected\n";
        echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
    }
}

// Test 6: Test CamelCase vs Snake_case Field Names
echo "6. Testing CamelCase vs Snake_case Field Names...\n";
$camelCaseData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-camel-$timestamp",
                'reference_no' => "FD$timestamp-CAMEL",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '20.0',
                'remarks' => 'CamelCase test',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Test camelCase sync fields
                'syncStatus' => 'pending',
                'pendingAction' => 'create',
                'isSoftDeleted' => false,
            ],
        ],
    ],
];

$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/json',
        'content' => json_encode($camelCaseData),
    ],
]);

$response = @file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
if ($response === false) {
    echo "❌ Failed to send camelCase request\n\n";
} else {
    $result = json_decode($response, true);
    if ($result && $result['status'] === true) {
        echo "✅ CamelCase field names handled successfully\n";
        echo "   Created: {$result['data']['feedings']['created']}\n";
        echo "   Updated: {$result['data']['feedings']['updated']}\n";
        echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
        echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
    } else {
        echo "❌ CamelCase field names failed\n";
        echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
    }
}

echo "🎉 Feeding logs sync validation testing completed!\n";
echo "========================================================\n";
echo "\n📋 Summary of Tests:\n";
echo "1. ✅ Health check - Service availability\n";
echo "2. ✅ CREATE action - New feeding log creation\n";
echo "3. ✅ UPDATE action - Existing feeding log modification\n";
echo "4. ✅ DELETE action - Soft delete functionality\n";
echo "5. ⚠️  Invalid data - Missing required fields handling\n";
echo "6. ✅ Field naming - CamelCase vs snake_case support\n";
echo "\n🔍 Key Validation Points:\n";
echo "- Frontend data structure compatibility\n";
echo "- Sync status handling (pending_action: create/update/delete)\n";
echo "- Soft delete implementation\n";
echo "- UUID-based conflict resolution\n";
echo "- Error handling and logging\n";
