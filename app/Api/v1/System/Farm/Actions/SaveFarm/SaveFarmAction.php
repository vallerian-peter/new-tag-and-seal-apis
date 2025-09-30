<?php

namespace App\Api\v1\System\Farm\Actions\SaveFarm;

use App\Models\Country;
use App\Models\Farm;
use App\Models\FarmLivestockType;
use App\Models\FarmOwner;
use App\Models\FarmStatus;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class SaveFarmAction
{

    public static function handle($request, $farmerUser) {
        try {

            DB::beginTransaction();

            if ($request->regional_registration_number) {
                //check if farm exists
                $exists = Farm::where('regional_reg_no', $request->regional_registration_number)->get();
                if (count($exists) > 0) {
                    DB::rollBack();
                    return ['status' => false, 'code' => 100, 'message' => 'Farm already registered', 'data' => []];
                }
            }

            $exists = Farm::where([
                'regional_reg_no' => $request->regional_registration_number,
                'name' => htmlspecialchars($request->name ?? ''),
                'physical_address' => htmlspecialchars($request->physical_address ?? ''),
                'size' => $request->size,
                'size_unit_id' => $request->size_unit,
                'gps' => $request->gps,
                'country_id' => Country::TANZANIA,
                'region_id' => $request->region,
                'district_id' => $request->district,
                'ward_id' => $request->ward,
                'created_by' => $farmerUser->id,
                'farm_status_id' => FarmStatus::ACTIVE,
                'legal_status_id' => $request->legal_status,
            ])->first();

            if ($exists) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Farm information already registered', 'data' => []];
            }

            //save farm
            $save = Farm::create([
                'reference_no' => 'RN' . hrtime()[1],
                'regional_reg_no' => $request->regional_registration_number,
                'name' => htmlspecialchars($request->name ?? ''),
                'physical_address' => htmlspecialchars($request->physical_address ?? ''),
                'size' => $request->size,
                'size_unit_id' => $request->size_unit,
                'gps' => $request->gps,
                'country_id' => Country::TANZANIA,
                'region_id' => $request->region,
                'district_id' => $request->district,
                'ward_id' => $request->ward,
                'created_by' => $farmerUser->id,
                'farm_status_id' => FarmStatus::ACTIVE,
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
                'created_by' => $farmerUser->id,
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
                'farmer_id' => $farmerUser->profile_id,
                'assigned_by' => $farmerUser->id,
                'state_id' => 1,
                'created_at' => Carbon::now()
            ]);

            if (!$save_farm_owner) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to save farm owner.', 'data' => []];
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
