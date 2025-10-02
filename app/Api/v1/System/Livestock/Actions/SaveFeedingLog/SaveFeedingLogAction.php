<?php

namespace App\Api\v1\System\Livestock\Actions\SaveFeedingLog;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Feeding;
use App\Models\Livestock;
use App\Models\State;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaveFeedingLogAction
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

            //save feeding log
            $save = Feeding::create([
                'uuid' => $request->uuid ?? \Illuminate\Support\Str::uuid(),
                'reference_no'=> $request->reference_no ?? 'FD'.hrtime()[1],
                'farm_id'=> $request->farmId,
                'livestock_id' =>$request->livestockId,
                'feeding_type_id'=> $request->feedTypeId,
                'amount'=> $request->amount,
                'feeding_time'=>$request->date,
                'remarks'=>$request->remarks,
                'created_by' => $user->id,
                'state_id' => State::ACTIVE,
                'sync_status' => 'synced',
                'device_id' => $request->device_id ?? null,
                'original_created_at' => $request->original_created_at ?? Carbon::now('Africa/Dar_es_Salaam'),
                'last_modified_at' => Carbon::now('Africa/Dar_es_Salaam'),
                'created_at' => Carbon::now('Africa/Dar_es_Salaam')
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save Feeding.', 'data' => []];
            }


            $data = [
                'livestock_id'=>$save->livestock_id,
                'date'=>$save->feeding_time
            ];
            DB::commit();
            return ['code' => 200,  'message' => 'Feeding Recorded Successfully.', 'data' => $data];
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
