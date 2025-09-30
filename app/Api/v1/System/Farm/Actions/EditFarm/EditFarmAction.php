<?php

namespace App\Api\v1\System\Farm\Actions\EditFarm;

use App\Models\Farm;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class EditFarmAction
{
    public static function handle($request)
    {
        DB::beginTransaction();

        try {
            // Check if farm exists
            $farm = Farm::where('id', $request->farm_id)->first();
            if (!$farm) {
                DB::rollBack();
                return [
                    'status' => false,
                    'code' => 404,
                    'message' => 'Farm not found.',
                    'data' => []
                ];
            }

            // Check if user has permission to edit this farm
            // You might want to add authorization logic here

            // Update farm details
            $farm->name = $request->name ?? $farm->name;
            $farm->size = $request->size ?? $farm->size;
            $farm->size_unit_id = $request->size_unit ?? $farm->size_unit_id;
            $farm->physical_address = $request->physical_address ?? $farm->physical_address;
            $farm->regional_reg_no = $request->regional_registration_number ?? $farm->regional_reg_no;
            $farm->region_id = $request->region ?? $farm->region_id;
            $farm->district_id = $request->district ?? $farm->district_id;
            $farm->ward_id = $request->ward ?? $farm->ward_id;
            $farm->latitudes = $request->latitudes ?? $farm->latitudes;
            $farm->longitudes = $request->longitudes ?? $farm->longitudes;
            $farm->updated_by = $request->user()->id;
            $farm->updated_at = Carbon::now('Africa/Dar_es_Salaam');

            $farm->save();

            DB::commit();

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Farm updated successfully.',
                'data' => $farm
            ];

        } catch (\Exception $e) {
            DB::rollBack();
            return [
                'status' => false,
                'code' => 500,
                'message' => 'Failed to update farm: ' . $e->getMessage(),
                'data' => []
            ];
        }
    }
}
