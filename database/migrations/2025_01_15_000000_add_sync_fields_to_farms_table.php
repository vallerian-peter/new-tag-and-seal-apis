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
        Schema::table('farms', function (Blueprint $table) {
            // Add UUID field for conflict-free sync (nullable first, then make unique)
            if (!Schema::hasColumn('farms', 'uuid')) {
                $table->string('uuid')->nullable()->after('id');
            }

            // Add sync status field
            if (!Schema::hasColumn('farms', 'sync_status')) {
                $table->string('sync_status')->default('synced')->after('uuid');
            }

            // Add last modified timestamp for sync tracking
            if (!Schema::hasColumn('farms', 'last_modified_at')) {
                $table->timestamp('last_modified_at')->nullable()->after('sync_status');
            }

            // Add device ID for tracking which device created/modified
            if (!Schema::hasColumn('farms', 'device_id')) {
                $table->string('device_id')->nullable()->after('last_modified_at');
            }

            // Add original created timestamp for conflict resolution
            if (!Schema::hasColumn('farms', 'original_created_at')) {
                $table->timestamp('original_created_at')->nullable()->after('device_id');
            }

            // Add soft delete field
            if (!Schema::hasColumn('farms', 'is_soft_deleted')) {
                $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            }

            // Add pending action field for offline operations
            if (!Schema::hasColumn('farms', 'pending_action')) {
                $table->string('pending_action')->nullable()->after('is_soft_deleted');
            }
        });

        // Generate UUIDs for existing farms
        $farms = \App\Models\Farm::whereNull('uuid')->orWhere('uuid', '')->get();
        foreach ($farms as $farm) {
            $farm->uuid = \Illuminate\Support\Str::uuid()->toString();
            $farm->sync_status = 'synced';
            $farm->last_modified_at = now();
            $farm->device_id = 'legacy_device';
            $farm->original_created_at = $farm->created_at;
            $farm->is_soft_deleted = false;
            $farm->pending_action = null;
            $farm->save();
        }

        // Now add the unique constraint
        Schema::table('farms', function (Blueprint $table) {
            if (Schema::hasColumn('farms', 'uuid')) {
                $table->unique('uuid');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('farms', function (Blueprint $table) {
            if (Schema::hasColumn('farms', 'pending_action')) {
                $table->dropColumn('pending_action');
            }
            if (Schema::hasColumn('farms', 'is_soft_deleted')) {
                $table->dropColumn('is_soft_deleted');
            }
            if (Schema::hasColumn('farms', 'original_created_at')) {
                $table->dropColumn('original_created_at');
            }
            if (Schema::hasColumn('farms', 'device_id')) {
                $table->dropColumn('device_id');
            }
            if (Schema::hasColumn('farms', 'last_modified_at')) {
                $table->dropColumn('last_modified_at');
            }
            if (Schema::hasColumn('farms', 'sync_status')) {
                $table->dropColumn('sync_status');
            }
            if (Schema::hasColumn('farms', 'uuid')) {
                $table->dropColumn('uuid');
            }
        });
    }
};
