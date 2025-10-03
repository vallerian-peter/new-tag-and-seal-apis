<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Remove sync columns from farms table, keep only uuid
        Schema::table('farms', function (Blueprint $table) {
            if (Schema::hasColumn('farms', 'sync_status')) {
                $table->dropColumn('sync_status');
            }
            if (Schema::hasColumn('farms', 'device_id')) {
                $table->dropColumn('device_id');
            }
            if (Schema::hasColumn('farms', 'original_created_at')) {
                $table->dropColumn('original_created_at');
            }
            if (Schema::hasColumn('farms', 'is_soft_deleted')) {
                $table->dropColumn('is_soft_deleted');
            }
            if (Schema::hasColumn('farms', 'pending_action')) {
                $table->dropColumn('pending_action');
            }
            // Keep uuid and last_modified_at (or updated_at)
        });

        // Remove sync columns from livestocks table, keep only uuid
        Schema::table('livestocks', function (Blueprint $table) {
            if (Schema::hasColumn('livestocks', 'sync_status')) {
                $table->dropColumn('sync_status');
            }
            if (Schema::hasColumn('livestocks', 'device_id')) {
                $table->dropColumn('device_id');
            }
            if (Schema::hasColumn('livestocks', 'original_created_at')) {
                $table->dropColumn('original_created_at');
            }
            if (Schema::hasColumn('livestocks', 'is_soft_deleted')) {
                $table->dropColumn('is_soft_deleted');
            }
            if (Schema::hasColumn('livestocks', 'pending_action')) {
                $table->dropColumn('pending_action');
            }
            // Keep uuid and last_modified_at (or updated_at)
        });

        // Remove sync columns from feedings table, keep only uuid and deleted_at
        Schema::table('feedings', function (Blueprint $table) {
            // Keep uuid and deleted_at (soft deletes)
            // Remove any other sync columns if they exist
        });

        // Remove sync columns from livestock_inseminations table, keep only uuid and deleted_at
        Schema::table('livestock_inseminations', function (Blueprint $table) {
            // Keep uuid, farm_id, and deleted_at (soft deletes)
            // Remove any other sync columns if they exist
        });

        // Check and remove sync columns from other log tables if they exist
        $logTables = [
            'milkings',
            'pregnancies', 
            'medications',
            'vaccinations',
            'calvings',
            'dewormings',
            'weight_gains',
            'drying_offs',
            'animal_disposals',
            'vaccines'
        ];

        foreach ($logTables as $tableName) {
            if (Schema::hasTable($tableName)) {
                Schema::table($tableName, function (Blueprint $table) use ($tableName) {
                    // Remove sync columns if they exist
                    if (Schema::hasColumn($tableName, 'sync_status')) {
                        $table->dropColumn('sync_status');
                    }
                    if (Schema::hasColumn($tableName, 'device_id')) {
                        $table->dropColumn('device_id');
                    }
                    if (Schema::hasColumn($tableName, 'original_created_at')) {
                        $table->dropColumn('original_created_at');
                    }
                    if (Schema::hasColumn($tableName, 'is_soft_deleted')) {
                        $table->dropColumn('is_soft_deleted');
                    }
                    if (Schema::hasColumn($tableName, 'pending_action')) {
                        $table->dropColumn('pending_action');
                    }
                    // Keep uuid and deleted_at (soft deletes) if they exist
                });
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Re-add sync columns to farms table
        Schema::table('farms', function (Blueprint $table) {
            $table->string('sync_status')->default('synced')->after('uuid');
            $table->string('device_id')->nullable()->after('last_modified_at');
            $table->timestamp('original_created_at')->nullable()->after('device_id');
            $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            $table->string('pending_action')->nullable()->after('is_soft_deleted');
        });

        // Re-add sync columns to livestocks table
        Schema::table('livestocks', function (Blueprint $table) {
            $table->string('sync_status')->default('synced')->after('uuid');
            $table->string('device_id')->nullable()->after('last_modified_at');
            $table->timestamp('original_created_at')->nullable()->after('device_id');
            $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            $table->string('pending_action')->nullable()->after('is_soft_deleted');
        });

        // Re-add sync columns to log tables
        $logTables = [
            'milkings',
            'pregnancies', 
            'medications',
            'vaccinations',
            'calvings',
            'dewormings',
            'weight_gains',
            'drying_offs',
            'animal_disposals',
            'vaccines'
        ];

        foreach ($logTables as $tableName) {
            if (Schema::hasTable($tableName)) {
                Schema::table($tableName, function (Blueprint $table) {
                    $table->string('sync_status')->default('synced')->after('uuid');
                    $table->string('device_id')->nullable()->after('last_modified_at');
                    $table->timestamp('original_created_at')->nullable()->after('device_id');
                    $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
                    $table->string('pending_action')->nullable()->after('is_soft_deleted');
                });
            }
        }
    }
};
