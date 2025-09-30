<?php

namespace App\Api\v1\System\Livestock\Actions\SaveVaccinationLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\State;
use App\Models\Vaccination;
use App\Models\VaccinationDose;
use App\Models\VaccinationStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveVaccinationLogAction
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

            //save vaccination log
            $save = Vaccination::create([
                'vaccination_no' => 'VC' . hrtime()[1],
                'livestock_id' => $request->livestockId,
                'vaccine_id' => $request->vaccineId,
                'disease_id'=> $request->diseaseId,
                'created_by' => $user->id,
                'vaccination_status_id' => VaccinationStatus::COMPLETED,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save vaccination.', 'data' => []];
            }

            //save vaccination dose
            $saveVaccinationDose = VaccinationDose::create([
                'vaccination_id'=>$save->id,
                'batch_number'=>$request->batchNo,
                'quantity_administered'=>$request->quantityAdministered,
                'administration_route'=>$request->administrationRoute,
                'rate'=>$request->rate,
                'vaccination_date'=> $request->vaccinationDate,
                'next_administration_date'=>$request->nextVaccinationDate,
                'state_id'=> State::ACTIVE,
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
