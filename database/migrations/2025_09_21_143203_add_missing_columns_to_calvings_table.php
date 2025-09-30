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
        Schema::table('calvings', function (Blueprint $table) {
            // Add missing ID columns for relationships
            $table->unsignedBigInteger('calving_problems_id')->nullable()->after('calving_type_id');
            $table->unsignedBigInteger('reproductive_problem_id')->nullable()->after('calving_problems_id');
            $table->text('remarks')->nullable()->after('reproductive_problem_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('calvings', function (Blueprint $table) {
            $table->dropColumn(['calving_problems_id', 'reproductive_problem_id', 'remarks']);
        });
    }
};
