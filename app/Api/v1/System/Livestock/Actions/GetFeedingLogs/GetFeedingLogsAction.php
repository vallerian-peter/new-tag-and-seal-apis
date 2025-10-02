<?php

namespace App\Api\v1\System\Livestock\Actions\GetFeedingLogs;

use App\Models\FarmLivestock;
use App\Models\Feeding;

class GetFeedingLogsAction
{
    public static function handle($request){
//        $logs = [];
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
                $livestocks[$i]['logs'] = Feeding::where('livestock_id',$livestocks[$i]['id'])
                    ->leftJoin('feeding_types', 'feeding_types.id', '=', 'feedings.feeding_type_id')
                    ->select('feedings.*', 'feeding_types.name as feed_type_name')
                    ->get();
            }
        }

        return ['status' => true, 'code' => 200,  'message' => 'Feeding Log Details Fetched successfully', 'data' => $livestocks];

    }
}
