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
        // Add sync fields to farms table
        Schema::table('farms', function (Blueprint $table) {
            $table->string('sync_status')->default('synced')->after('uuid');
            $table->timestamp('last_modified_at')->nullable()->after('sync_status');
            $table->string('device_id')->nullable()->after('last_modified_at');
            $table->timestamp('original_created_at')->nullable()->after('device_id');
            $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            $table->string('pending_action')->nullable()->after('is_soft_deleted');
        });

        // Add sync fields to livestocks table
        Schema::table('livestocks', function (Blueprint $table) {
            $table->string('sync_status')->default('synced')->after('uuid');
            $table->timestamp('last_modified_at')->nullable()->after('sync_status');
            $table->string('device_id')->nullable()->after('last_modified_at');
            $table->timestamp('original_created_at')->nullable()->after('device_id');
            $table->boolean('is_soft_deleted')->default(false)->after('original_created_at');
            $table->string('pending_action')->nullable()->after('is_soft_deleted');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Remove sync fields from farms table
        Schema::table('farms', function (Blueprint $table) {
            $table->dropColumn([
                'sync_status',
                'last_modified_at',
                'device_id',
                'original_created_at',
                'is_soft_deleted',
                'pending_action'
            ]);
        });

        // Remove sync fields from livestocks table
        Schema::table('livestocks', function (Blueprint $table) {
            $table->dropColumn([
                'sync_status',
                'last_modified_at',
                'device_id',
                'original_created_at',
                'is_soft_deleted',
                'pending_action'
            ]);
        });
    }
};
