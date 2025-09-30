<?php

require_once 'vendor/autoload.php';

// Load Laravel app
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

echo "Testing Sync Migration Results\n";
echo "================================\n\n";

// Test tables to check
$tables = ['vaccinations', 'medications', 'calvings', 'dewormings', 'pregnancy_diagnosis'];

foreach ($tables as $table) {
    echo "Checking table: $table\n";
    
    if (Schema::hasTable($table)) {
        echo "✅ Table exists\n";
        
        // Check for sync fields
        $syncFields = ['uuid', 'last_modified_at', 'sync_status', 'device_id', 'original_created_at', 'deleted_at'];
        
        foreach ($syncFields as $field) {
            if (Schema::hasColumn($table, $field)) {
                echo "  ✅ $field column exists\n";
            } else {
                echo "  ❌ $field column missing\n";
            }
        }
        
        // Check index on uuid
        try {
            $indexes = DB::select("SHOW INDEX FROM $table WHERE Column_name = 'uuid'");
            if (count($indexes) > 0) {
                echo "  ✅ uuid index exists\n";
            } else {
                echo "  ⚠️  uuid index missing\n";
            }
        } catch (Exception $e) {
            echo "  ⚠️  Could not check uuid index\n";
        }
        
    } else {
        echo "❌ Table does not exist\n";
    }
    
    echo "\n";
}

// Test UUID generation for existing records
echo "Testing UUID Generation\n";
echo "=======================\n";

try {
    // Check if we can create a Vaccination model with sync fields
    $vaccination = new \App\Models\Vaccination();
    $fillable = $vaccination->getFillable();
    
    if (in_array('uuid', $fillable)) {
        echo "✅ Vaccination model has uuid in fillable\n";
    } else {
        echo "❌ Vaccination model missing uuid in fillable\n";
    }
    
    if (in_array('sync_status', $fillable)) {
        echo "✅ Vaccination model has sync_status in fillable\n";
    } else {
        echo "❌ Vaccination model missing sync_status in fillable\n";
    }
    
} catch (Exception $e) {
    echo "❌ Error testing Vaccination model: " . $e->getMessage() . "\n";
}

echo "\nMigration test completed!\n";
