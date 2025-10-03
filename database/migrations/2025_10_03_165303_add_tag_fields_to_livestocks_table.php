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
            // Add tag fields for comprehensive livestock identification
            if (!Schema::hasColumn('livestocks', 'dummy_tag_id')) {
                $table->string('dummy_tag_id')->nullable()->after('identification_number');
            }

            if (!Schema::hasColumn('livestocks', 'barcode_tag_id')) {
                $table->string('barcode_tag_id')->nullable()->after('dummy_tag_id');
            }

            if (!Schema::hasColumn('livestocks', 'rfid_tag_id')) {
                $table->string('rfid_tag_id')->nullable()->after('barcode_tag_id');
            }

            // Add unique constraints for barcode and RFID tags (nullable unique)
            if (!Schema::hasColumn('livestocks', 'barcode_tag_id')) {
                $table->unique('barcode_tag_id');
            }

            if (!Schema::hasColumn('livestocks', 'rfid_tag_id')) {
                $table->unique('rfid_tag_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('livestocks', function (Blueprint $table) {
            if (Schema::hasColumn('livestocks', 'rfid_tag_id')) {
                $table->dropUnique(['rfid_tag_id']);
                $table->dropColumn('rfid_tag_id');
            }

            if (Schema::hasColumn('livestocks', 'barcode_tag_id')) {
                $table->dropUnique(['barcode_tag_id']);
                $table->dropColumn('barcode_tag_id');
            }

            if (Schema::hasColumn('livestocks', 'dummy_tag_id')) {
                $table->dropColumn('dummy_tag_id');
            }
        });
    }
};
