<?php

namespace App\Api\v1\System\Livestock\Actions\SaveInseminationLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\LivestockInseminations;
use App\Models\State;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveInseminationLogAction
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

            // Get the livestock serial number
            $livestockSerial = $livestock[0]->identification_number;

            //save insemination log
            $save = LivestockInseminations::create([
                'reference_no'=> 'LI'.hrtime()[1],
                'livestock_id' => $request->livestockId,
                'serial' => $livestockSerial,
                'last_heat_date'=> $request->lastHeatDate,
                'current_heat_type_id'=> $request->currentHeatTypeId,
                'insemination_date'=> $request->inseminationDate,
                'insemination_service_id'=> $request->inseminationServiceId,
                'insemination_semen_straw_type_id'=> $request->inseminationSemenStrawTypeId,
                'bull_code'=> $request->bullCode,
                'bull_breed'=> $request->bullBreed,
                'semen_production_date'=> $request->semenProductionDate,
                'production_country'=> $request->semenProductionDate,
                'semen_batch_number'=> $request->semenBatchNumber,
                'international_id'=> $request->internationalId,
                'ai_code'=> $request->aiCode,
                'manufacturer_name'=> $request->manufacturerName,
                'semen_supplier'=> $request->semenSupplier,
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
                'date'=>$save->insemination_date
            ];

            DB::commit();
            return ['status' => true, 'code' => 200, 'message' => 'Insemination Recorded Successfully.', 'data' => $data];
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
