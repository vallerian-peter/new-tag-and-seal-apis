<?php

namespace App\Api\v1\System\Livestock\Actions\SaveCalvingLog;

use App\Models\Calf;
use App\Models\CalfProblem;
use App\Models\CalfReproductiveProblem;
use App\Models\Calving;
use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveCalvingLogAction
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

            //save calving log
            $save = Calving::create([
                'reference_no'=> 'CVN'.hrtime()[1],
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'calving_type_id'=>$request->calvingTypeId,
                'calving_problems_id'=>$request->calvingProblemId,
                'reproductive_problem_id'=>$request->reproductiveProblemId,
                'remarks'=>$request->remarks,
                'created_by' => $user->id,
                'state_id' => 1,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Calving.', 'data' => []];
            }
            // Get livestock gender from the livestock record
            $livestockRecord = Livestock::find($request->livestockId);
            $livestockGender = $livestockRecord ? $livestockRecord->gender_id : 1; // Default to male if not found

            $save_calf = Calf::create(
                [
                    'calving_id'=>$save->id,
                    'gender_id'=>$livestockGender,
                    'created_by'=>$user->id,
                    'state_id'=>1,
                    'created_at'=> Carbon::now('Africa/Dar_es_Salaam')

                ]);

            if(!$save_calf){
                DB::rollBack();
                return ['status'=> false, 'code'=> 100,
                    'message'=> 'Failed To Save Calf',
                    'data'=> []
                ];
            }
            $save_calf_problem = CalfProblem::create([
                'calf_id'=>$save_calf->id,
                'calf_problem_type_id'=>$request->calvingProblemId,
                'remarks'=>$request->remarks,
                'created_by' =>$user->id,
                'state_id'=>1,
                'created_at'=> Carbon::now('Africa/Dar_es_Salaam')]);
            if(!$save_calf_problem){
                DB::rollBack();
                return ['status'=> false, 'code'=> 100,
                    'message'=> 'Failed to Save Calf Problem'
                ];
            }
            $save_Calf_reproductive_problem=CalfReproductiveProblem::create([
                'calf_id'=>$save_calf->id,
                'problem_type_id'=>$request->reproductiveProblemId,
                'remarks'=>$request->remarks,
                'created_by' =>$user->id,
                'state_id'=>1,
                'created_at'=> Carbon::now('Africa/Dar_es_Salaam')]);
            if(!$save_Calf_reproductive_problem){
                DB::rollBack();
                return ['status'=> false, 'code'=> 100,
                    'message'=> 'Failed To Save Calf Reproductive Problem',
                    'data'=> []
                ];
            }
            $data = [
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->created_at
            ];
            DB::commit();
            return ['code' => 200,  'message' => 'Calving Details Recorded Successfully.', 'data' => $data];
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
