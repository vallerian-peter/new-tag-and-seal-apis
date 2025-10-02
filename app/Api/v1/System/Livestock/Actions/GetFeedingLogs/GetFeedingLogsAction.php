<?php

namespace App\Api\v1\System\Livestock\Actions\GetFeedingLogs;

use App\Models\FarmLivestock;
use App\Models\Feeding;

class GetFeedingLogsAction
{
    public static function handle($request){
        //get livestock
        $livestocks = FarmLivestock::where('farm_id', $request->farmId)
            ->join('livestocks', 'livestocks.id', '=', 'farm_livestocks.livestock_id')
            ->leftJoin('genders', 'genders.id', '=', 'livestocks.gender_id')
            ->select('livestocks.id','livestocks.identification_number','livestocks.name', 'livestocks.gender_id', 'genders.name as gender_name')
            ->get();

        if(count($livestocks) > 0){
            //get feeding log
            for($i=0;$i<count($livestocks);$i++){
                $livestock = $livestocks[$i];
                $livestocks[$i]['id'] = $livestock->id;
                $livestocks[$i]['identification_number'] = $livestock->identification_number;
                $livestocks[$i]['name'] = $livestock->name;
                $livestocks[$i]['gender_id'] = $livestock->gender_id;
                $livestocks[$i]['gender_name'] = $livestock->gender_name;

                // Get feeding logs with all sync fields
                $logs = Feeding::where('livestock_id',$livestocks[$i]['id'])
                    ->leftJoin('feeding_types', 'feeding_types.id', '=', 'feedings.feeding_type_id')
                    ->select('feedings.*', 'feeding_types.name as feed_type_name')
                    ->get();

                // Transform logs to match Flutter expectations
                $transformedLogs = $logs->map(function($log) {
                    return [
                        'id' => $log->id,
                        'uuid' => $log->uuid,
                        'reference_no' => $log->reference_no,
                        'farm_id' => $log->farm_id,
                        'livestock_id' => $log->livestock_id,
                        'feeding_type_id' => $log->feeding_type_id,
                        'amount' => $log->amount,
                        'remarks' => $log->remarks,
                        'feeding_time' => $log->feeding_time,
                        'created_by' => $log->created_by,
                        'updated_by' => $log->updated_by,
                        'state_id' => $log->state_id,
                        'created_at' => $log->created_at,
                        'updated_at' => $log->updated_at,
                        'last_modified_at' => $log->last_modified_at,
                        'sync_status' => $log->sync_status,
                        'device_id' => $log->device_id,
                        'original_created_at' => $log->original_created_at,
                        'deleted_at' => $log->deleted_at,
                        'feed_type_name' => $log->feed_type_name
                    ];
                });

                $livestocks[$i]['logs'] = $transformedLogs;
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Feeding Log Details Fetched successfully', 'data' => $livestocks];

    }
}
