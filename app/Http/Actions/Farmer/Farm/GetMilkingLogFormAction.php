<?php

namespace App\Http\Actions\Farmer\Farm;

use App\Models\FarmLivestock;
use App\Models\Milking;
use Illuminate\Http\Request;

class GetMilkingLogFormAction{
    public function handle(Request $request){
        $farm = $request->farm_id;

        //get livestock
        $livestock = FarmLivestock::where('farm_id', $farm)->get();
        if(count($livestock) > 0){
            //get milking log
            for($i=0;$i<count($livestock);$i++){
                $log = Milking::where('livestock_id',$livestock[$i]['livestock_id'])->get();
            }

        return ['status' => true, 'code' => 200,  'message' => 'Milking Log Details Fetched successfully', 'data' => $log];
        }
    }

}
