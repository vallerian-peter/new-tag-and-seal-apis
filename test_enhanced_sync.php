<?php

/**
 * Test script for Enhanced Sync API
 * This script tests the new comprehensive sync endpoint that handles multiple data types
 */

// Configuration
$baseUrl = 'http://localhost:8002/api'; // Adjust this to your server URL
$testData = [
    'device_id' => 'test_device_' . time(),
    'farmer_no' => 'FARMER001', // Use a valid farmer number from your database
    'data' => [
        'farms' => [
            [
                'uuid' => 'test-farm-uuid-' . time(),
                'name' => 'Test Farm ' . date('Y-m-d H:i:s'),
                'size' => '10',
                'size_unit_id' => '1',
                'physical_address' => 'Test Address',
                'regional_registration_number' => 'REG' . time(),
                'livestock_type_id' => '1',
                'legal_status_id' => '1',
                'gps' => '-6.7924,39.2083',
                'district_id' => '1',
                'region_id' => '1',
                'ward_id' => '1',
                'country_id' => '1',
                'sync_status' => 'pending',
                'pending_action' => 'create',
                'is_soft_deleted' => false
            ]
        ],
        'livestocks' => [
            [
                'uuid' => 'test-livestock-uuid-' . time(),
                'identification_number' => 'LIV' . time(),
                'name' => 'Test Livestock ' . date('Y-m-d H:i:s'),
                'date_of_birth' => '2020-01-01',
                'gender_id' => '1',
                'breed_id' => '1',
                'species_id' => '1',
                'livestock_type_id' => '1',
                'farm_id' => '1', // This should be a valid farm ID
                'sync_status' => 'pending',
                'pending_action' => 'create',
                'is_soft_deleted' => false
            ]
        ],
        'vaccinations' => [
            [
                'uuid' => 'test-vaccination-uuid-' . time(),
                'livestock_id' => '1', // This should be a valid livestock ID
                'vaccine_id' => '1',
                'vaccination_date' => date('Y-m-d'),
                'next_vaccination_date' => date('Y-m-d', strtotime('+1 year')),
                'officer_id' => '1',
                'sync_status' => 'pending',
                'pending_action' => 'create',
                'is_soft_deleted' => false
            ]
        ]
    ]
];

/**
 * Make HTTP request
 */
function makeRequest($url, $data = null, $method = 'GET') {
    $ch = curl_init();
    
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Accept: application/json'
    ]);
    
    if ($method === 'POST' && $data) {
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    }
    
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $error = curl_error($ch);
    
    curl_close($ch);
    
    if ($error) {
        return ['error' => $error, 'http_code' => 0];
    }
    
    return [
        'data' => json_decode($response, true),
        'http_code' => $httpCode,
        'raw_response' => $response
    ];
}

/**
 * Test health check
 */
function testHealthCheck($baseUrl) {
    echo "=== Testing Health Check ===\n";
    
    $url = $baseUrl . '/sync/public/enhanced/health';
    $result = makeRequest($url);
    
    if ($result['http_code'] === 200) {
        echo "✅ Health check passed\n";
        echo "Response: " . json_encode($result['data'], JSON_PRETTY_PRINT) . "\n";
        return true;
    } else {
        echo "❌ Health check failed\n";
        echo "HTTP Code: " . $result['http_code'] . "\n";
        echo "Response: " . $result['raw_response'] . "\n";
        return false;
    }
}

/**
 * Test statistics
 */
function testStatistics($baseUrl) {
    echo "\n=== Testing Statistics ===\n";
    
    $url = $baseUrl . '/sync/public/enhanced/statistics';
    $result = makeRequest($url);
    
    if ($result['http_code'] === 200) {
        echo "✅ Statistics retrieved successfully\n";
        echo "Response: " . json_encode($result['data'], JSON_PRETTY_PRINT) . "\n";
        return true;
    } else {
        echo "❌ Statistics failed\n";
        echo "HTTP Code: " . $result['http_code'] . "\n";
        echo "Response: " . $result['raw_response'] . "\n";
        return false;
    }
}

/**
 * Test sync multiple
 */
function testSyncMultiple($baseUrl, $testData) {
    echo "\n=== Testing Sync Multiple ===\n";
    
    $url = $baseUrl . '/sync/public/enhanced/sync-multiple';
    $result = makeRequest($url, $testData, 'POST');
    
    if ($result['http_code'] === 200) {
        echo "✅ Sync multiple completed successfully\n";
        echo "Response: " . json_encode($result['data'], JSON_PRETTY_PRINT) . "\n";
        return true;
    } else {
        echo "❌ Sync multiple failed\n";
        echo "HTTP Code: " . $result['http_code'] . "\n";
        echo "Response: " . $result['raw_response'] . "\n";
        return false;
    }
}

/**
 * Test with invalid data
 */
function testInvalidData($baseUrl) {
    echo "\n=== Testing Invalid Data ===\n";
    
    $invalidData = [
        'device_id' => 'test_device',
        // Missing farmer_no
        'data' => [
            'farms' => [
                [
                    // Missing required fields
                    'name' => 'Test Farm'
                ]
            ]
        ]
    ];
    
    $url = $baseUrl . '/sync/public/enhanced/sync-multiple';
    $result = makeRequest($url, $invalidData, 'POST');
    
    if ($result['http_code'] === 400) {
        echo "✅ Invalid data correctly rejected\n";
        echo "Response: " . json_encode($result['data'], JSON_PRETTY_PRINT) . "\n";
        return true;
    } else {
        echo "❌ Invalid data not properly handled\n";
        echo "HTTP Code: " . $result['http_code'] . "\n";
        echo "Response: " . $result['raw_response'] . "\n";
        return false;
    }
}

/**
 * Main test function
 */
function runTests() {
    global $baseUrl, $testData;
    
    echo "Enhanced Sync API Test Suite\n";
    echo "============================\n";
    echo "Base URL: $baseUrl\n";
    echo "Test Data: " . json_encode($testData, JSON_PRETTY_PRINT) . "\n\n";
    
    $tests = [
        'Health Check' => function() use ($baseUrl) { return testHealthCheck($baseUrl); },
        'Statistics' => function() use ($baseUrl) { return testStatistics($baseUrl); },
        'Sync Multiple' => function() use ($baseUrl, $testData) { return testSyncMultiple($baseUrl, $testData); },
        'Invalid Data' => function() use ($baseUrl) { return testInvalidData($baseUrl); }
    ];
    
    $passed = 0;
    $total = count($tests);
    
    foreach ($tests as $testName => $testFunction) {
        try {
            if ($testFunction()) {
                $passed++;
            }
        } catch (Exception $e) {
            echo "❌ Test '$testName' threw exception: " . $e->getMessage() . "\n";
        }
    }
    
    echo "\n=== Test Results ===\n";
    echo "Passed: $passed/$total\n";
    echo "Success Rate: " . round(($passed / $total) * 100, 2) . "%\n";
    
    if ($passed === $total) {
        echo "🎉 All tests passed!\n";
    } else {
        echo "⚠️  Some tests failed. Check the output above.\n";
    }
}

// Run the tests
runTests();

?>
