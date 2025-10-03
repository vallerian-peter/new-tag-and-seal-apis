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
        Schema::table('livestock_inseminations', function (Blueprint $table) {
            $table->string('uuid')->nullable()->after('id');
            $table->string('farm_id')->nullable()->after('livestock_id');
            $table->softDeletes();
        });

        // Populate UUIDs for existing records
        DB::statement('UPDATE livestock_inseminations SET uuid = UUID() WHERE uuid IS NULL');

        // Make UUID unique after populating
        Schema::table('livestock_inseminations', function (Blueprint $table) {
            $table->unique('uuid');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('livestock_inseminations', function (Blueprint $table) {
            $table->dropUnique(['uuid']);
            $table->dropColumn(['uuid', 'farm_id', 'deleted_at']);
        });
    }
};
