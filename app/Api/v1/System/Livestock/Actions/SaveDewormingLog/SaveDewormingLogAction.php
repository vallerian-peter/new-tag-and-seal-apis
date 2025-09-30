<?php

namespace App\Api\v1\System\Livestock\Actions\SaveDewormingLog;

use App\Models\Deworming;
use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\State;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveDewormingLogAction
{
    public static function handle($request)
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

            //save deworming log
            $save = Deworming::create([
                'reference_no'=> 'DW'.hrtime()[1],
                'dose'=> $request->dose,
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'medicine_id'=> $request->medicineId,
                'quantity'=> $request->quantity,
                'quantity_unit_id'=>2,
                'administration_route'=>$request->administrationRoute,
                'next_administration_date'=> $request->nextDate,
                'remarks'=> $request->remarks,
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
            return ['code' => 200,  'message' => 'Deworming Details Recorded Successfully.', 'data' => $data];
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
