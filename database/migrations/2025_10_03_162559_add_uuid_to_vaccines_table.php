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
        // Generate UUIDs for existing records that have empty or null UUIDs
        $vaccines = DB::table('vaccines')->where(function($query) {
            $query->whereNull('uuid')->orWhere('uuid', '');
        })->get();

        foreach ($vaccines as $vaccine) {
            DB::table('vaccines')
                ->where('id', $vaccine->id)
                ->update(['uuid' => \Illuminate\Support\Str::uuid()->toString()]);
        }

        // Now make it unique and not nullable
        Schema::table('vaccines', function (Blueprint $table) {
            $table->string('uuid')->unique()->nullable(false)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('vaccines', function (Blueprint $table) {
            $table->dropColumn('uuid');
        });
    }
};
