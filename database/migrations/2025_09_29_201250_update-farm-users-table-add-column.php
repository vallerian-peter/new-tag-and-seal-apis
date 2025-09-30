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
        Schema::table('farm_users', function (Blueprint $table) {
            if(!Schema::hasColumn('farm_users', 'role')){
                $table->string('role')->after('state_id')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('farm_users', function (Blueprint $table) {
            if(Schema::hasColumn('farm_users', 'role')){
                $table->dropColumn('role');
            }
        });
    }
};
