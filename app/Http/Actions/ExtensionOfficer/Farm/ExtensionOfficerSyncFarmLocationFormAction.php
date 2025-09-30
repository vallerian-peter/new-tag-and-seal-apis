<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ExtensionOfficerSyncFarmLocationFormAction
{
    public function handle(Request $request)
    {

        try {
            DB::beginTransaction();

            $farm = Farm::find($request->farm_id);
            $officer = ExtensionOfficer::find($request->officer_id);

            //check if officer assigned to this farm
            $officerFarm = ExtensionOfficerFarm::where(['farm_id' => $farm->id, 'extension_officer_id' => $officer->id,'state_id' => 1])->get();
            if (count($officerFarm) <= 0) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'You are not belong to this farm', 'data' => []];
            }

            //save coordinates
            $updateCoordinates = $farm->update([
                'latitudes' => $request->latitudes,
                'longitudes' => $request->longitudes,
                'updated_by' => $officer->id,
                'updated_at' => Carbon::now(),
                'has_coordinates' => true
            ]);

            if (!$updateCoordinates) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to update farm coordinates', 'data' => []];
            }

            DB::commit();
            return ['status' => true, 'code' => 200, 'message' => 'Farm coordinates updated successfully', 'data' => []];
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
