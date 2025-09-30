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
        Schema::table('milkings', function (Blueprint $table) {
            $table->string('acidity', 10)->nullable()->after('colony_forming_units');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('milkings', function (Blueprint $table) {
            $table->dropColumn('acidity');
        });
    }
};
