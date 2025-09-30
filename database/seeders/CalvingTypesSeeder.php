<?php

namespace Database\Seeders;

use App\Models\CalvingType;
use Illuminate\Database\Seeder;

class CalvingTypesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Calving types
        $types = [
            [
                'name' => 'Normal',
                'color' => '#004b23',
            ],
            [
                'name' => 'Abnormal',
                'color' => '#fb8500',
            ],
        ];

        foreach ($types as $type) {
            CalvingType::create($type);
        }
    }
}
