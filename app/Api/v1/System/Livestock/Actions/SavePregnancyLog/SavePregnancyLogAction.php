<?php

namespace App\Api\v1\System\Livestock\Actions\SavePregnancyLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\PregnancyDiagnosis;
use App\Models\State;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SavePregnancyLogAction
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

            //save medication log
            $save = PregnancyDiagnosis::create([
                'reference_no'=> 'PD'.hrtime()[1],
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'serial' => $livestockSerial,
                'test_result_id'=> $request->pregnancyStatusId,
                'no_of_months'=>$request->months,
                'test_date'=> $request->date,
                'remarks'=>$request->remarks,
                'created_by' => $user->id,
                'state_id' => State::ACTIVE,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Feeding.', 'data' => []];
            }


            $data = [
                'id' => $save->id,
                'reference_no' => $save->reference_no,
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->test_date
            ];
            DB::commit();
            return ['status' => true, 'code' => 200,  'message' => 'Pregnancy Diagnosis Recorded Successfully.', 'data' => $data];
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
