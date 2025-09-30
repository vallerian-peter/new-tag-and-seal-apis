<?php

namespace App\Api\v1\System\Livestock\Actions\SaveMedicationLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\Medication;
use App\Models\State;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveMedicationLogAction
{
    public static function handle( $request)
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
            $save = Medication::create([
                'farm_id'=> $request->farmId,
                'livestock_id' => $request->livestockId,
                'disease_id'=> $request->diseaseId,
                'medicine_id'=>$request->medicineId,
                'quantity'=>$request->quantity,
                'quantity_unit_id'=>$request->quantityUnitId,
                'withdrawal_period'=>$request->withdrawalPeriod,
                'withdrawal_period_unit_id'=>$request->withdrawalPeriodUnitId,
                'medication_date'=>$request->date,
                'remarks'=>$request->remarks,
                // 'vet_id'=>$request->officer_id,
                'created_by' => $user->id,
                'state_id' => State::ACTIVE,
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save medication.', 'data' => []];
            }


            $data = [
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->medication_date
            ];

            DB::commit();
            return ['code' => 200,  'message' => 'Medication Recorded Successfully.', 'data' => $data];
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
