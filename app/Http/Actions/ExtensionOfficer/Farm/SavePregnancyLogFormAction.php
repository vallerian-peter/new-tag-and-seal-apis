<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\PregnancyDiagnosis;
use App\Models\Farm;
use Illuminate\Http\Request;
use App\Models\ExtensionOfficer;
use Illuminate\Support\Facades\DB;
use App\Models\Vet;
use Illuminate\Support\Carbon;
use App\Models\Medication;
use App\Models\Medicine;
use App\Models\Livestock;
use App\Models\Disease;
use App\Models\VaccinationDose;
use App\Models\FarmLivestock;
use App\Models\PregnancyDiagnosisTestResult;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


class SavePregnancyLogFormAction
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

            //save medication log
            $save = PregnancyDiagnosis::create([
                        'reference_no'=> 'PD'.hrtime()[1],
                        'farm_id'=> $request->farm_id,
                        'livestock_id' =>$request->livestock_id,
                        'test_result_id'=> $request->pregnancy_status_id,
                        'no_of_months'=>$request->months,
                        'test_date'=> $request->date,
                        'remarks'=>$request->remarks,
                        'created_by' => $user->id,
                        'state_id' => 1,
                        'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Feeding.', 'data' => []];
            }

          
          $data = [
            'livestock_id'=>$save->livestock_id,
            'date'=>$save->test_date
          ];
          DB::commit();
            return ['code' => 200,  'message' => 'Pregnancy Diagnosis Recorded Successfully.', 'data' => $data];
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
