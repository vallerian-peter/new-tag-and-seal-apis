<?php

namespace App\Api\v1\System\Livestock\Actions\GetVaccinationLogs;

use App\Models\Vaccination;
use App\Models\VaccinationDose;
use App\Models\FarmLivestock;

class GetVaccinationLogsAction
{
    public static function handle($request){
        $farm = $request->farmId;

        //get livestock for the farm
        $livestocks = FarmLivestock::where('farm_id', $request->farmId)
            ->join('livestocks', 'livestocks.id', '=', 'farm_livestocks.livestock_id')
            ->select('livestocks.id','livestocks.identification_number','livestocks.name')
            ->get();

        if(count($livestocks) > 0){
            //get vaccination logs for each livestock
            for($i=0;$i<count($livestocks);$i++){
                $livestock = $livestocks[$i];
                $livestocks[$i]['id'] = $livestock->id;
                $livestocks[$i]['identification_number'] = $livestock->identification_number;
                $livestocks[$i]['name'] = $livestock->name;

                // Get vaccination logs with relationships
                $vaccinations = Vaccination::where('livestock_id', $livestocks[$i]['id'])
                    ->with(['vaccine', 'disease', 'vet', 'extensionOfficer', 'status', 'doses'])
                    ->get();

                $livestocks[$i]['logs'] = $vaccinations;
            }
        }

        return ['status' => true, 'code' => 200, 'message' => 'Vaccination Log Details Fetched successfully', 'data' => $livestocks];

    }
}
