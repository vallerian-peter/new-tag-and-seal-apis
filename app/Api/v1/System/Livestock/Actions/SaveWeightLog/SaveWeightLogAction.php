<?php

namespace App\Api\v1\System\Livestock\Actions\SaveWeightLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\State;
use App\Models\WeightGain;
use App\Models\WeightUnit;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveWeightLogAction
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

            //save medication log
            $save = WeightGain::create([
                'reference_no'=> 'WG'.hrtime()[1],
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'weight'=> $request->weight,
                'remarks'=> $request->remarks,
                 'weight_gain'=> $request->weight, //calculate wait gain to prev wait measure
                'weight_gain_unit_id'=> WeightUnit::KILOGRAMS,
                'created_by' => $user->id,
                'state_id' => State::ACTIVE,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Feeding.', 'data' => []];
            }

            $data = [
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->created_at
            ];
            DB::commit();
            return ['code' => 200,  'message' => 'Weight Details Recorded Successfully.', 'data' => $data];
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
