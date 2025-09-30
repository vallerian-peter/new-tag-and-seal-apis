#!/bin/bash

# Comprehensive Sync API Endpoint Tests
# Run this script to test all sync endpoints with curl

echo "🧪 Testing Comprehensive Sync API Endpoints"
echo "============================================="

# Base URL - adjust if needed
BASE_URL="http://localhost/itag-mycattle-apis-v1-master/public/api"

echo ""
echo "🔍 1. Testing Health Check Endpoint..."
curl -s -X GET "${BASE_URL}/sync/comprehensive/health" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" | jq '.'

echo ""
echo ""
echo "📊 2. Testing Statistics Endpoint..."
curl -s -X GET "${BASE_URL}/sync/comprehensive/statistics?device_id=test_device_123" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" | jq '.'

echo ""
echo ""
echo "⬆️  3. Testing Upload Endpoint..."
curl -s -X POST "${BASE_URL}/sync/comprehensive/upload" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "table_name": "vaccinations",
    "device_id": "test_device_123",
    "records": [
      {
        "uuid": "test-uuid-12345",
        "vaccination_no": "VAC001",
        "livestock_id": 1,
        "vaccine_id": 1,
        "disease_id": 1,
        "vet_id": 1,
        "extension_officer_id": 1,
        "created_by": 1,
        "vaccination_status_id": 1,
        "last_modified_at": "2025-09-29T10:00:00Z"
      }
    ]
  }' | jq '.'

echo ""
echo ""
echo "⬇️  4. Testing Download Endpoint..."
curl -s -X POST "${BASE_URL}/sync/comprehensive/download" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "table_name": "vaccinations",
    "device_id": "different_device_456",
    "last_sync_time": "2025-09-29T09:00:00Z"
  }' | jq '.'

echo ""
echo ""
echo "🔄 5. Testing Conflict Resolution..."
curl -s -X POST "${BASE_URL}/sync/comprehensive/resolve-conflicts" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{
    "table_name": "vaccinations",
    "strategy": "last_write_wins"
  }' | jq '.'

echo ""
echo ""
echo "✅ All endpoint tests completed!"
echo ""
echo "🔧 To test manually:"
echo "   Health Check: GET ${BASE_URL}/sync/comprehensive/health"
echo "   Statistics:   GET ${BASE_URL}/sync/comprehensive/statistics?device_id=YOUR_DEVICE"
echo "   Upload:       POST ${BASE_URL}/sync/comprehensive/upload"
echo "   Download:     POST ${BASE_URL}/sync/comprehensive/download"
echo "   Resolve:      POST ${BASE_URL}/sync/comprehensive/resolve-conflicts"
echo ""
