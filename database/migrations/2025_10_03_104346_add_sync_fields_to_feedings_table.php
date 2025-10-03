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
        Schema::table('feedings', function (Blueprint $table) {
            // Add UUID column if it doesn't exist
            if (!Schema::hasColumn('feedings', 'uuid')) {
                $table->string('uuid')->nullable()->after('id');
            }

            // Add soft delete column for soft delete functionality
            if (!Schema::hasColumn('feedings', 'deleted_at')) {
                $table->softDeletes();
            }
        });

        // Populate UUIDs for existing records
        $feedings = DB::table('feedings')->whereNull('uuid')->get();
        foreach ($feedings as $feeding) {
            DB::table('feedings')
                ->where('id', $feeding->id)
                ->update([
                    'uuid' => \Illuminate\Support\Str::uuid()->toString(),
                ]);
        }

        // Make UUID unique after populating
        Schema::table('feedings', function (Blueprint $table) {
            if (!Schema::hasColumn('feedings', 'uuid')) {
                $table->unique('uuid');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('feedings', function (Blueprint $table) {
            $table->dropColumn([
                'uuid',
                'deleted_at'
            ]);
        });
    }
};
