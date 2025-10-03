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
        Schema::table('livestocks', function (Blueprint $table) {
            // Add UUID field for conflict-free sync (nullable first, then make unique)
            if (!Schema::hasColumn('livestocks', 'uuid')) {
                $table->string('uuid')->nullable()->after('id');
            }

            // Add sync status field
            if (!Schema::hasColumn('livestocks', 'sync_status')) {
                $table->string('sync_status')->default('synced')->after('uuid');
            }

            // Add last modified timestamp for sync tracking
            if (!Schema::hasColumn('livestocks', 'last_modified_at')) {
                $table->timestamp('last_modified_at')->nullable()->after('sync_status');
            }

            // Add device ID for tracking which device created/modified
            if (!Schema::hasColumn('livestocks', 'device_id')) {
                $table->string('device_id')->nullable()->after('last_modified_at');
            }

            // Add original created timestamp for conflict resolution
            if (!Schema::hasColumn('livestocks', 'original_created_at')) {
                $table->timestamp('original_created_at')->nullable()->after('device_id');
            }

            // Add soft delete field
            if (!Schema::hasColumn('livestocks', 'is_soft_deleted')) {
                $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            }

            // Add pending action field for offline operations
            if (!Schema::hasColumn('livestocks', 'pending_action')) {
                $table->string('pending_action')->nullable()->after('is_soft_deleted');
            }
        });

        // Generate UUIDs for existing livestocks
        $livestocks = \App\Models\Livestock::whereNull('uuid')->orWhere('uuid', '')->get();
        foreach ($livestocks as $animal) {
            $animal->uuid = \Illuminate\Support\Str::uuid()->toString();
            $animal->sync_status = 'synced';
            $animal->last_modified_at = now();
            $animal->device_id = 'legacy_device';
            $animal->original_created_at = $animal->created_at;
            $animal->is_soft_deleted = false;
            $animal->pending_action = null;
            $animal->save();
        }

        // Now add the unique constraint
        Schema::table('livestocks', function (Blueprint $table) {
            if (Schema::hasColumn('livestocks', 'uuid')) {
                $table->unique('uuid');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('livestocks', function (Blueprint $table) {
            if (Schema::hasColumn('livestocks', 'pending_action')) {
                $table->dropColumn('pending_action');
            }
            if (Schema::hasColumn('livestocks', 'is_soft_deleted')) {
                $table->dropColumn('is_soft_deleted');
            }
            if (Schema::hasColumn('livestocks', 'original_created_at')) {
                $table->dropColumn('original_created_at');
            }
            if (Schema::hasColumn('livestocks', 'device_id')) {
                $table->dropColumn('device_id');
            }
            if (Schema::hasColumn('livestocks', 'last_modified_at')) {
                $table->dropColumn('last_modified_at');
            }
            if (Schema::hasColumn('livestocks', 'sync_status')) {
                $table->dropColumn('sync_status');
            }
            if (Schema::hasColumn('livestocks', 'uuid')) {
                $table->dropColumn('uuid');
            }
        });
    }
};
