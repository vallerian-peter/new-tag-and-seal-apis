<?php

require_once 'vendor/autoload.php';

// Test feeding logs sync functionality
$baseUrl = 'http://10.0.2.2:8002/api';
$timestamp = time();

echo "🧪 Testing Feeding Logs Sync Functionality\n";
echo "==========================================\n\n";

// Test 1: Health Check
echo "1. Testing Enhanced Sync Health Check...\n";
$healthResponse = file_get_contents("$baseUrl/sync/public/enhanced/health");
$healthData = json_decode($healthResponse, true);

if ($healthData && $healthData['status'] === true) {
    echo "✅ Enhanced sync service is healthy\n";
    echo "   Supported models: " . implode(', ', $healthData['data']['supported_models']) . "\n\n";
} else {
    echo "❌ Enhanced sync service is unhealthy\n\n";
    exit(1);
}

// Test 2: Create Feeding Log
echo "2. Testing Feeding Log Creation...\n";
$deviceId = "test-device-$timestamp";
$testData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-uuid-$timestamp",
                'reference_no' => "FD$timestamp",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '10.5',
                'remarks' => 'Test feeding log',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Sync fields (not stored in DB but used for logic)
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

$response = file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
$result = json_decode($response, true);

if ($result && $result['status'] === true) {
    echo "✅ Feeding log created successfully\n";
    echo "   Created: {$result['data']['feedings']['created']}\n";
    echo "   Updated: {$result['data']['feedings']['updated']}\n";
    echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
    echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
} else {
    echo "❌ Feeding log creation failed\n";
    echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
}

// Test 3: Update Feeding Log
echo "3. Testing Feeding Log Update...\n";
$updateData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-uuid-$timestamp",
                'reference_no' => "FD$timestamp-UPDATED",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '15.0',
                'remarks' => 'Updated test feeding log',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Sync fields (not stored in DB but used for logic)
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

$response = file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
$result = json_decode($response, true);

if ($result && $result['status'] === true) {
    echo "✅ Feeding log updated successfully\n";
    echo "   Created: {$result['data']['feedings']['created']}\n";
    echo "   Updated: {$result['data']['feedings']['updated']}\n";
    echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
    echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
} else {
    echo "❌ Feeding log update failed\n";
    echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
}

// Test 4: Soft Delete Feeding Log
echo "4. Testing Feeding Log Soft Delete...\n";
$deleteData = [
    'device_id' => $deviceId,
    'farmer_no' => 'FARMER001',
    'data' => [
        'feedings' => [
            [
                'uuid' => "test-feeding-uuid-$timestamp",
                'reference_no' => "FD$timestamp-UPDATED",
                'farm_id' => '1',
                'livestock_id' => '1',
                'feeding_type_id' => '1',
                'amount' => '15.0',
                'remarks' => 'Updated test feeding log',
                'feeding_time' => date('Y-m-d H:i:s'),
                'created_by' => '1',
                'state_id' => '1',
                // Sync fields (not stored in DB but used for logic)
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

$response = file_get_contents("$baseUrl/sync/public/enhanced/sync-multiple", false, $context);
$result = json_decode($response, true);

if ($result && $result['status'] === true) {
    echo "✅ Feeding log soft deleted successfully\n";
    echo "   Created: {$result['data']['feedings']['created']}\n";
    echo "   Updated: {$result['data']['feedings']['updated']}\n";
    echo "   Deleted: {$result['data']['feedings']['deleted']}\n";
    echo "   Errors: {$result['data']['feedings']['errors']}\n\n";
} else {
    echo "❌ Feeding log soft delete failed\n";
    echo "   Response: " . json_encode($result, JSON_PRETTY_PRINT) . "\n\n";
}

// Test 5: Get Statistics
echo "5. Testing Sync Statistics...\n";
$statsResponse = file_get_contents("$baseUrl/sync/public/enhanced/statistics");
$statsData = json_decode($statsResponse, true);

if ($statsData && $statsData['status'] === true) {
    echo "✅ Statistics retrieved successfully\n";
    if (isset($statsData['data']['feedings'])) {
        echo "   Feedings total: {$statsData['data']['feedings']['total']}\n";
        echo "   Feedings synced: {$statsData['data']['feedings']['synced']}\n";
        echo "   Feedings pending: {$statsData['data']['feedings']['pending']}\n";
    }
    echo "\n";
} else {
    echo "❌ Statistics retrieval failed\n";
    echo "   Response: " . json_encode($statsData, JSON_PRETTY_PRINT) . "\n\n";
}

echo "🎉 Feeding logs sync testing completed!\n";
echo "==========================================\n";
