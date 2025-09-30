<?php

namespace App\Api\v1\System\Livestock\Actions\SaveMilkingLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\Milking;
use App\Models\MilkingStatus;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveMilkingLogAction
{
    public static function handle($request)
    {
        try {
            // Debug: Log the incoming request data
            \Log::info('SaveMilkingLog - Request data:', $request->all());
            \Log::info('SaveMilkingLog - Acidity value:', ['acidity' => $request->acidity ?? 'NOT_SET']);

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

            //save log
            $save = Milking::create([
                'reference_no' => 'ML' . hrtime()[1],
                'livestock_id' => $request->livestockId,
                'amount' => $request->amount,
                'lactometer_reading' => $request->lactometerReading,
                'solid' => $request->solid,
                'solid_non_fat' => $request->solidNonFat,
                'total_solids' => $request->solid + $request->solidNonFat,
                'protein' => $request->protein,
                'corrected_lactometer_reading' => $request->correctedLactometerReading,
                'colony_forming_units' => $request->colonyFormingUnit,
                'milking_method_id' => $request->milkingMethodId,
                'milking_session_id'=> $request->milkingSessionId,
                'milking_unit_id' => $request->milkingUnitId,
                'acidity' => $request->acidity,
                'created_by' => $user->id,
                'milking_status_id' => MilkingStatus::COMPLETED,
                'created_at' => Carbon::now()
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farms.', 'data' => []];
            }

            DB::commit();
            return ['status' => true, 'code' => 200,  'message' => 'Milking Logged Successfully.', 'data' => $save];
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
