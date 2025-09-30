<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App;
use Illuminate\Http\Request;
use App\Models\Farmer;
use Illuminate\Support\Facades\DB;
use App\Models\Farm;
use Illuminate\Support\Carbon;
use App\Models\FarmLivestockType;
use App\Models\FarmOwner;
use App\Models\User;
use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use Illuminate\Support\Facades\Auth;



class ExtensionOfficerRegisterFarmFormAction
{
    public function handle(Request $request)
    {
        try {

            DB::beginTransaction();

            //get farmer
            $farmer = Farmer::where(['farmer_no' => $request->farmer_no])->get();
            if (count($farmer) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Invalid farmer no provided',
                    'data' => []
                ];
            }

            //check if farmer is active
            if ($farmer[0]['farmer_status_id'] != 1) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => []
                ];
            }
            //get user details
            $user = Auth::user();

            //get officer details
            $officer = ExtensionOfficer::query()->where('email', $user->username)
            ->orWhere(function ($query) use ($user) {
                $query->where([
                    'id' => $user->profile_id
                ]);
            })->first();

            //check if farm exists
            $exists = Farm::where('regional_reg_no', $request->regional_registration_number)->get();
            if (count($exists) > 0) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Farm already registered', 'data' => []];
            }

            //save farm
            $save = Farm::create([
                'reference_no' => 'RN' . hrtime()[1],
                'regional_reg_no' => $request->regional_registration_number,
                'name' => htmlspecialchars($request->name ?? ''),
                'physical_address' => htmlspecialchars($request->physical_address ?? ''),
                'size' => $request->size,
                'size_unit_id' => $request->size_unit,
                'latitudes' => $request->latitudes,
                'longitudes' => $request->longitudes,
                'country_id' => 1,
                'region_id' => $request->region,
                'district_id' => $request->district,
                'ward_id' => $request->ward,
                'created_by' => $officer->id,
                'farm_status_id' => 1,
                'legal_status_id' => $request->legal_status,
                'created_at' => Carbon::now()
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farms.', 'data' => []];
            }

            //save farm livestock types
            $type = $request->livestock_type;

            $saveFarmLivestockType = FarmLivestockType::create([
                'farm_id' => $save->id,
                'livestock_type_id' => $type,
                'created_by' => $officer->id,
                'created_at' => Carbon::now(),
                'state_id' => 1
            ]);

            if (!$saveFarmLivestockType) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farm livestock types.', 'data' => []];
            }

            //farms owner
            $save_farm_owner = FarmOwner::create([
                'farm_id' => $save->id,
                'farmer_id' => $farmer[0]->id,
                'assigned_by' => $officer->id,
                'state_id' => 1,
                'created_at' => Carbon::now()
            ]);

            if (!$save_farm_owner) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to save farm owner.', 'data' => []];
            }

            
            //Assign Officer
            $assign = ExtensionOfficerFarm::create([
                'extension_officer_id' => filter_var($officer->id, FILTER_VALIDATE_INT),
                'farm_id' => filter_var($save->id, FILTER_VALIDATE_INT),
                'created_at' => Carbon::now(),
                'state_id' => 1,
                'assigned_by' => $officer->id
            ]);

            if (!$assign) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to assign extension officer', 'data' => []];
            }

            DB::commit();
            return ['status' => true, 'code' => 200,  'message' => 'Farm registered successfully.', 'data' => $save];
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
