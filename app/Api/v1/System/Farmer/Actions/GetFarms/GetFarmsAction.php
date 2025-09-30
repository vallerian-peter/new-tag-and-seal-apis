<?php

namespace App\Api\v1\System\Farmer\Actions\GetFarms;

use App\Models\Farm;
use App\Models\FarmOwner;
use App\Models\Farmer;
use App\Models\FarmerStatus;

class GetFarmsAction
{
    public static function handle($request) {
        try {
            // Get farmer
            $farmer = Farmer::where(['farmer_no' => $request->farmer_no])->first();
            if (!$farmer) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Invalid farmer no provided',
                    'data' => []
                ];
            }

            // Check if farmer is active
            if ($farmer->farmer_status_id != FarmerStatus::ACTIVE) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => []
                ];
            }

            // Get all farms for this farmer
            $farms = Farm::join('farm_owners', 'farms.id', '=', 'farm_owners.farm_id')
                ->where('farm_owners.farmer_id', $farmer->id)
                ->where('farms.farm_status_id', 1) // Only active farms
                ->select(
                    'farms.id',
                    'farms.name',
                    'farms.reference_no',
                    'farms.regional_reg_no',
                    'farms.physical_address',
                    'farms.size',
                    'farms.gps',
                    'farms.created_at'
                )
                ->get();

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Farms retrieved successfully',
                'data' => $farms
            ];
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
