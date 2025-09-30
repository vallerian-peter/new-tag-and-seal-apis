<?php

namespace App\Api\v1\System\Livestock\Actions\SaveDryingOffLog;

use App\Models\DryingOff;
use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\State;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveDryingOffLogAction
{

    public static function handle(Request $request)
    {
        try {

            DB::beginTransaction();
            //get user
            $user = Auth::user();
            //get farm
            $farm = Farm::where(['id' => $request->farmId])->get();
            if (count($farm) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'farm details not found',
                    'data' => []
                ];
            }
            $livestock = Livestock::where(['id'=> $request->livestockId])->get();
            if (count($livestock) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Livestock details not found',
                    'data' => []
                ];
            }
            $livestock_belong_to_farm = FarmLivestock::where('livestock_id', $request->livestockId)
                ->where('farm_id',$request->farmId)->get();
            if (count($livestock_belong_to_farm) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Livestock does not belong to this farm',
                    'data' => []
                ];
            }

            // Get the livestock serial number
            $livestockSerial = $livestock[0]->identification_number;
            
            //save drying off log
            $save = DryingOff::create([
                'reference_no'=> 'DRF'.hrtime()[1],
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'serial' => $livestockSerial,
                'start_date'=> $request->startDate,
                'end_date'=> $request->endDate,
                'expected_calving_date'=> $request->expectedCalvingDate,
                'created_by' => $user->id,
                'state_id' => State::ACTIVE,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Feeding.', 'data' => []];
            }


            $data = [
                'id'=>$save->id,
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->created_at,
                'reference_no'=>$save->reference_no
            ];
            DB::commit();
            return ['code' => 200,  'message' => 'Drying Off Recorded Successfully.', 'data' => $data];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => []
            ];
        }
    }
}
