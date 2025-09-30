<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\Vaccination;
use App\Models\Milking;
use Illuminate\Http\Request;
use App\Models\Farmer;
use Illuminate\Support\Facades\DB;
use App\Models\Farm;
use Illuminate\Support\Carbon;
use App\Models\Vaccine;
use App\Models\VaccinationStatus;
use App\Models\Disease;
use App\Models\VaccinationDose;
use App\Models\Livestock;
use App\Models\FarmLivestock;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


class SaveLogVaccinationFormAction
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

            //save vaccination log
            $save = Vaccination::create([
                'vaccination_no' => 'VC' . hrtime()[1],
                'farm_id'=> $request->farm_id,
                'livestock_id' => $request->livestock_id,
                'vaccine_id' => $request->vaccine_id,
                'disease_id'=> $request->diseases_id,
                'vet_id' => $request->vet_id,
                'extension_officer_id'=>$request->officer_id, 
                'created_by' => $user->id,
                'vaccination_status_id' => 1,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save vaccination.', 'data' => []];
            }

            //save vaccination dose
        $saveVaccinationDose = VaccinationDose::create([
                    'vaccination_id'=>$save->id,
                    'batch_number'=>$request->batch_no,
                    'quantity_administered'=>$request->quantity_administered,
                    'administration_route'=>$request->administration_route,
                    'rate'=>$request->rate,
                    'vaccination_date'=> $request->vaccination_date,
                    'next_administration_date'=>$request->next_vaccination_date,
                    'state_id'=>1,
                    'remarks'=>$request->remarks,
                    'created_by'=>$user->id,
                    'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            
            if (!$saveVaccinationDose) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save vaccination.', 'data' => []];
            }
            DB::commit();
            return ['status' => true, 'code' => 200,  'message' => 'Vaccination Logged Successfully.', 'data' => $save];
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
