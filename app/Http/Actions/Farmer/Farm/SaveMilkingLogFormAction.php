<?php

namespace App\Http\Actions\Farmer\Farm;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use App\Models\Milking;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class SaveMilkingLogFormAction
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

            //save log
            $save = Milking::create([
                'reference_no' => 'ML' . hrtime()[1],
                'livestock_id' => $request->livestock_id,
                'amount' => $request->amount,
                'lactometer_reading' => $request->lactometer_reading,
                'solid' => $request->solid,
                'solid_non_fat' => $request->solid_non_fat,
                'protein' => $request->protein,
                'corrected_lactometer_reading' => $request->corrected_lactometer_reading,
                'colony_forming_units' => $request->colony_forming_unit,
                'milking_method_id' => $request->milking_unit_id,
                'milking_session_id'=> $request->milking_session_id,
                'milking_unit_id' => $request->milking_unit_id,
                'created_by' => $user->id,
                'milking_status_id' => 1,
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
