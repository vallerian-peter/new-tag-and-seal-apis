<?php

namespace App\Api\v1\System\Farmer\Actions\Vaccination;

use App\Models\Vaccine;
use App\Models\VaccineBatch;
use App\Api\v1\System\Farmer\Actions\Vaccination\GetVaccineRequest;

class GetVaccineAction
{
    public static function handle(GetVaccineRequest $request)
    {
        try {
            $farmId = $request->input('farmId');

            // Fetch vaccines with relationships including batches
            $vaccines = Vaccine::with(['farm', 'status', 'type', 'schedule', 'batches'])
                ->where('farm_id', $farmId)
                ->get();

            // Transform into desired JSON structure
            $data = $vaccines->map(function ($vaccine) {
                // Get the latest batch for this vaccine
                $batch = $vaccine->batches->sortByDesc('created_at')->first();

                return [
                    'id' => $vaccine->id,
                    'farm_name'        => $vaccine->farm?->name,
                    'vaccine_name'     => $vaccine->name,
                    'lot'              => $vaccine->lot,
                    'formulation_type' => $vaccine->formulation_type,
                    'dose'             => $vaccine->dose,
                    'batch_number'     => $batch?->batch_number,
                    'quantity'         => $batch?->quantity,
                    'expiry_date'      => $batch?->expiry_date ? (is_string($batch->expiry_date) ? $batch->expiry_date : $batch->expiry_date->format('Y-m-d')) : null,
                    'batches'          => $vaccine->batches->map(function ($batch) {
                        return [
                            'id' => $batch->id,
                            'batch_number' => $batch->batch_number,
                            'quantity' => $batch->quantity,
                            'expiry_date' => $batch->expiry_date ? (is_string($batch->expiry_date) ? $batch->expiry_date : $batch->expiry_date->format('Y-m-d')) : null,
                        ];
                    }),
                ];
            });

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Vaccines retrieved successfully.',
                'data' => $data
            ];
        } catch (\Exception $e) {
            return [
                'status' => false,
                'code' => 100,
                'message' => 'Error retrieving vaccines: ' . $e->getMessage(),
                'data' => []
            ];
        }
    }
}
