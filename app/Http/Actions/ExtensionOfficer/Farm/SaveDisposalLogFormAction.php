<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\AnimalDisposal;
use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Livestock;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class SaveDisposalLogFormAction
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
            $save = AnimalDisposal::create([
                        'reference_no'=> 'AD'.hrtime()[1],
                        'farm_id'=> $request->farm_id,
                        'livestock_id' =>$request->livestock_id,
                        'meat_obtaines'=> $request->weight,
                        'animal_disposal_type_id'=> $request->disposal_type_id,
                        'extension_officer_id'=>$request->officer_id,
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
            'date'=>$save->created_at
          ];
          DB::commit();
            return ['code' => 200,  'message' => 'Animal Disposal Details Recorded Successfully.', 'data' => $data];
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
