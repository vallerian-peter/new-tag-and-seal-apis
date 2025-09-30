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
        // Add serial column to pregnancy_diagnosis table
        if (!Schema::hasColumn('pregnancy_diagnosis', 'serial')) {
            Schema::table('pregnancy_diagnosis', function (Blueprint $table) {
                $table->string('serial', 250)->nullable()->after('livestock_id');
                $table->index('serial');
            });

            // Populate serial column with identification_number from livestocks table
            DB::statement('
                UPDATE pregnancy_diagnosis pd
                INNER JOIN livestocks l ON pd.livestock_id = l.id
                SET pd.serial = l.identification_number
            ');
        }

        // Add serial column to livestock_inseminations table
        if (!Schema::hasColumn('livestock_inseminations', 'serial')) {
            Schema::table('livestock_inseminations', function (Blueprint $table) {
                $table->string('serial', 250)->nullable()->after('livestock_id');
                $table->index('serial');
            });

            // Populate serial column with identification_number from livestocks table
            DB::statement('
                UPDATE livestock_inseminations li
                INNER JOIN livestocks l ON li.livestock_id = l.id
                SET li.serial = l.identification_number
            ');
        }

        // Ensure pregnancy_diagnosis_test_results has proper data
        $testResults = [
            ['id' => 1, 'name' => 'Doubtful', 'color' => '#004b23'],
            ['id' => 2, 'name' => 'Not Pregnant', 'color' => '#fb8500'],
            ['id' => 3, 'name' => 'Pregnant', 'color' => '#e76f51']
        ];

        foreach ($testResults as $result) {
            DB::table('pregnancy_diagnosis_test_results')->updateOrInsert(
                ['id' => $result['id']],
                [
                    'name' => $result['name'],
                    'color' => $result['color'],
                    'created_at' => now(),
                    'updated_at' => now()
                ]
            );
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('pregnancy_diagnosis', 'serial')) {
            Schema::table('pregnancy_diagnosis', function (Blueprint $table) {
                $table->dropColumn('serial');
            });
        }

        if (Schema::hasColumn('livestock_inseminations', 'serial')) {
            Schema::table('livestock_inseminations', function (Blueprint $table) {
                $table->dropColumn('serial');
            });
        }
    }
};
