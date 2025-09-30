<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Add serial column to drying_offs table
        Schema::table('drying_offs', function (Blueprint $table) {
            $table->string('serial', 250)->nullable()->after('livestock_id');
            $table->index('serial'); // Add index for faster queries
        });

        // Populate serial column with identification_number from livestocks table
        DB::statement('
            UPDATE drying_offs d
            INNER JOIN livestocks l ON d.livestock_id = l.id
            SET d.serial = l.identification_number
        ');

        // Make serial column not nullable after populating
        Schema::table('drying_offs', function (Blueprint $table) {
            $table->string('serial', 250)->nullable(false)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('drying_offs', function (Blueprint $table) {
            $table->dropColumn('serial');
        });
    }
};
