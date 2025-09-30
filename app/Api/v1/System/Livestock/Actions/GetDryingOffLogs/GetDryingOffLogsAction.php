<?php

namespace App\Api\v1\System\Livestock\Actions\GetDryingOffLogs;

use App\Models\DryingOff;
use App\Models\FarmLivestock;

class GetDryingOffLogsAction
{
    public static function handle($request){
//        $logs = [];
        //get livestock
        $livestocks = FarmLivestock::where('farm_id', $request->farmId)
            ->join('livestocks', 'livestocks.id', '=', 'farm_livestocks.livestock_id')
            ->select('livestocks.id','livestocks.identification_number','livestocks.name')
            ->get();
        if(count($livestocks) > 0){
            //get feeding log
            for($i=0;$i<count($livestocks);$i++){
                $livestock = $livestocks[$i];
                $livestocks[$i]['id'] = $livestock->id;
                $livestocks[$i]['identification_number'] = $livestock->identification_number;
                $livestocks[$i]['name'] = $livestock->name;
                // Get logs - now we can also query by serial if needed
                $logs = DryingOff::where('livestock_id',$livestocks[$i]['id'])->get();
                
                // Add serial to each log if not present (for backward compatibility)
                foreach($logs as $log) {
                    if(empty($log->serial)) {
                        $log->serial = $livestock->identification_number;
                        $log->save();
                    }
                }
                
                // Debug logging to track API response
                \Log::info('Drying Off API Debug', [
                    'livestock_id' => $livestocks[$i]['id'],
                    'livestock_serial' => $livestock->identification_number,
                    'logs_count' => $logs->count(),
                    'logs_data' => $logs->toArray()
                ]);
                
                $livestocks[$i]['logs'] = $logs;
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Feeding Log Details Fetched successfully', 'data' => $livestocks];

    }
}
