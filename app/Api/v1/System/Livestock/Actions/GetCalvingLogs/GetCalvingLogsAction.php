<?php

namespace App\Api\v1\System\Livestock\Actions\GetCalvingLogs;

use App\Models\Calving;
use App\Models\FarmLivestock;

class GetCalvingLogsAction
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
                $logs = Calving::where('livestock_id',$livestocks[$i]['id'])
                    ->with(['calvingType', 'calvingProblem', 'reproductiveProblem'])
                    ->get();

                // Debug: Log the relationship data
                foreach($logs as $log) {
                    \Log::info('Calving Log Debug', [
                        'log_id' => $log->id,
                        'calving_type_id' => $log->calving_type_id,
                        'calving_type_relationship' => $log->calvingType,
                        'calving_type_name' => $log->calvingType ? $log->calvingType->name : 'NULL',
                        'calving_problems_id' => $log->calving_problems_id,
                        'calving_problem_relationship' => $log->calvingProblem,
                        'calving_problem_name' => $log->calvingProblem ? $log->calvingProblem->name : 'NULL',
                        'reproductive_problem_id' => $log->reproductive_problem_id,
                        'reproductive_problem_relationship' => $log->reproductiveProblem,
                        'reproductive_problem_name' => $log->reproductiveProblem ? $log->reproductiveProblem->name : 'NULL',
                        'calfs_count' => $log->calfs ? $log->calfs->count() : 0,
                        'calfs_data' => $log->calfs ? $log->calfs->toArray() : []
                    ]);
                }

                $livestocks[$i]['logs'] = $logs;
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Livestock Calving Log Details Fetched successfully', 'data' => $livestocks];

    }
}
