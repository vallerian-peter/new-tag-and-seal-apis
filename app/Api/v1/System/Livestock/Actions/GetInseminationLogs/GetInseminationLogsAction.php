<?php

namespace App\Api\v1\System\Livestock\Actions\GetInseminationLogs;

use App\Models\FarmLivestock;
use App\Models\LivestockInseminations;

class GetInseminationLogsAction
{
    public static function handle($request){
//        $logs = [];
        //get livestock
        $livestocks = FarmLivestock::where('farm_id', $request->farmId)
            ->join('livestocks', 'livestocks.id', '=', 'farm_livestocks.livestock_id')
            ->select('livestocks.id','livestocks.identification_number','livestocks.name')
            ->get();
        if(count($livestocks) > 0){
            //get milking log
            for($i=0;$i<count($livestocks);$i++){
                $livestock = $livestocks[$i];
                $livestocks[$i]['id'] = $livestock->id;
                $livestocks[$i]['identification_number'] = $livestock->identification_number;
                $livestocks[$i]['name'] = $livestock->name;
                $logs = LivestockInseminations::where('livestock_id',$livestocks[$i]['id'])
                    ->with(['heatType', 'inseminationService', 'semenStrawType', 'breed'])
                    ->get();

                // Debug: Log the relationship data
                foreach($logs as $log) {
                    \Log::info('Insemination Log Debug', [
                        'log_id' => $log->id,
                        'insemination_service_id' => $log->insemination_service_id,
                        'insemination_service_relationship' => $log->inseminationService,
                        'insemination_service_name' => $log->inseminationService ? $log->inseminationService->name : 'NULL',
                        'semen_straw_type_id' => $log->insemination_semen_straw_type_id,
                        'semen_straw_type_relationship' => $log->semenStrawType,
                        'semen_straw_type_name' => $log->semenStrawType ? $log->semenStrawType->name : 'NULL',
                        'bull_breed_id' => $log->bull_breed,
                        'breed_relationship' => $log->breed,
                        'breed_name' => $log->breed ? $log->breed->name : 'NULL'
                    ]);
                }

                $livestocks[$i]['logs'] = $logs;
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Livestock Insemination Log Details Fetched successfully', 'data' => $livestocks];

    }
}
