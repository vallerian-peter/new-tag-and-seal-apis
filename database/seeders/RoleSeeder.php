<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Define the roles that match the Flutter app expectations
        $roles = [
            'Farm Manager',
            'Farm Worker',
            'Veterinary Assistant',
            'Feeding Specialist',
            'Milking Specialist'
        ];

        // Create roles if they don't exist
        foreach ($roles as $roleName) {
            Role::firstOrCreate(['name' => $roleName]);
        }
    }
}

