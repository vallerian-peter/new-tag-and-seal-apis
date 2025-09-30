<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class InseminationLookupTablesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Seed livestock_heat_types
        $heatTypes = [
            ['id' => 1, 'name' => 'Natural', 'color' => '#004b23'],
            ['id' => 2, 'name' => 'Artificial', 'color' => '#e76f51'],
        ];

        foreach ($heatTypes as $type) {
            DB::table('livestock_heat_types')->updateOrInsert(
                ['id' => $type['id']],
                [
                    'name' => $type['name'],
                    'color' => $type['color'],
                    'created_at' => now(),
                    'updated_at' => now()
                ]
            );
        }

        // Seed livestock_insemination_services
        $inseminationServices = [
            ['id' => 1, 'name' => 'Natural', 'color' => '#004b23'],
            ['id' => 2, 'name' => 'Artificial Insemination', 'color' => '#e76f51'],
            ['id' => 3, 'name' => 'Embryo Transfer', 'color' => '#e76f51'],
        ];

        foreach ($inseminationServices as $service) {
            DB::table('livestock_insemination_services')->updateOrInsert(
                ['id' => $service['id']],
                [
                    'name' => $service['name'],
                    'color' => $service['color'],
                    'created_at' => now(),
                    'updated_at' => now()
                ]
            );
        }

        // Seed livestock_insemination_semen_straw_types
        $semenStrawTypes = [
            ['id' => 1, 'name' => 'Conventional', 'category' => 'AI', 'color' => '#004b23'],
            ['id' => 2, 'name' => 'Sexed Semen Female', 'category' => 'AI', 'color' => '#004b23'],
            ['id' => 3, 'name' => 'Sexed Semen Male', 'category' => 'AI', 'color' => '#004b23'],
            ['id' => 4, 'name' => 'Embryo Male', 'category' => 'EMBRYO', 'color' => '#004b23'],
            ['id' => 5, 'name' => 'Embryo Female', 'category' => 'EMBRYO', 'color' => '#004b23'],
        ];

        foreach ($semenStrawTypes as $type) {
            DB::table('livestock_insemination_semen_straw_types')->updateOrInsert(
                ['id' => $type['id']],
                [
                    'name' => $type['name'],
                    'category' => $type['category'],
                    'color' => $type['color'],
                    'created_at' => now(),
                    'updated_at' => now()
                ]
            );
        }

        $this->command->info('Insemination lookup tables seeded successfully!');
    }
}
