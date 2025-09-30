<?php

namespace App\Api\v1\System\Livestock\Actions\GetPregnancyLogs;

use App\Models\FarmLivestock;
use App\Models\PregnancyDiagnosis;

class GetPregnancyLogsAction
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
                $logs = PregnancyDiagnosis::where('livestock_id',$livestocks[$i]['id'])
                    ->with('testResult')
                    ->get();

                // Debug: Log the relationship data
                foreach($logs as $log) {
                    \Log::info('Pregnancy Log Debug', [
                        'log_id' => $log->id,
                        'test_result_id' => $log->test_result_id,
                        'test_result_relationship' => $log->testResult,
                        'test_result_name' => $log->testResult ? $log->testResult->name : 'NULL'
                    ]);
                }

                $livestocks[$i]['logs'] = $logs;
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Pregnancy Log Details Fetched successfully', 'data' => $livestocks];

    }
}
