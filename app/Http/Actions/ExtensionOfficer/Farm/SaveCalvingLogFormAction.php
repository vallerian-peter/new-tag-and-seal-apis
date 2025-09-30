<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\CalfProblem;
use App\Models\Calving;
use App\Models\Farm;
use Illuminate\Http\Request;
use App\Models\ExtensionOfficer;
use Illuminate\Support\Facades\DB;
use App\Models\Vet;
use Illuminate\Support\Carbon;
use App\Models\CalfReproductiveProblemType;
use App\Models\CalfReproductiveProblem;
use App\Models\Livestock;
use App\Models\Calf;
use App\Models\VaccinationDose;
use App\Models\FarmLivestock;
use App\Models\AnimalDisposalType;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


class SaveCalvingLogFormAction
{
    public function handle(Request $request)
    {
        try {

            DB::beginTransaction();
            //get user
            $user = Auth::user();
            //get farm
            $farm = Farm::where(['id' => $request->farm_id])->get();
            if (count($farm) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'farm details not found',
                    'data' => []
                ];
            }
            $livestock = Livestock::where(['id'=> $request->livestock_id])->get();
            if (count($livestock) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Livestock details not found',
                    'data' => []
                ];
            }
            $livestock_belong_to_farm = FarmLivestock::where('livestock_id', $request->livestock_id)
            ->where('farm_id',$request->farm_id)->get();
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
                        'farm_id'=> $request->farm_id,
                        'livestock_id' =>$request->livestock_id,
                        'calving_type_id'=>$request->calving_type_id,
                        'created_by' => $user->id,
                        'state_id' => 1,
                        'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Calving.', 'data' => []];
            }
            $save_calf = Calf::create(
                [
                    'calving_id'=>$save->id,
                    'gender_id'=>$request->gender,
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
                    'calf_problem_type_id'=>$request->calving_problem_id,
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
                    'problem_type_id'=>$request->reproductive_problem_id,
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
