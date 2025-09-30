<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\Vaccination;
use App\Models\VaccinationDose;
use App\Models\Farm;
use App\Models\VaccinationStatus;
use App\Models\Vaccine;
use App\Models\Disease;
use App\Models\Livestock;
use App\Models\FarmLivestock;
use Illuminate\Http\Request;


class GetVaccinationLogFormAction
{
    public function handle(Request $request){
        $farm = $request->farm_id;

        // Get livestock for the farm first (since vaccinations table doesn't have farm_id)
        $livestockIds = FarmLivestock::where('farm_id', $farm)
            ->pluck('livestock_id')
            ->toArray();

        if (empty($livestockIds)) {
            return [
                'status' => true,
                'code' => 200,
                'message' => 'No livestock found for this farm',
                'data' => []
            ];
        }

        // Get vaccinations for all livestock in this farm
        $vaccinations = Vaccination::whereIn('livestock_id', $livestockIds)
            ->with([
                'livestock',
                'vaccine',
                'disease',
                'vet',
                'extensionOfficer',
                'status',
                'doses'
            ])
            ->get();

        if(count($vaccinations) > 0){
            return [
                'status' => true,
                'code' => 200,
                'message' => 'Vaccination Log Details Fetched successfully',
                'data' => $vaccinations
            ];
        } else {
            return [
                'status' => true,
                'code' => 200,
                'message' => 'No vaccination logs found for this farm',
                'data' => []
            ];
        }
    }
}
