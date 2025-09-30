<?php

namespace App\Api\v1\System\Farmer\Actions\CreateFarm;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Api\v1\System\Farm\Actions\SaveFarm\SaveFarmAction;
use App\Models\Farmer;
use App\Models\FarmerStatus;
use App\Models\User;

class CreateFarmAction
{
    public static function handle($request) {
        try {

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
            if ($farmer[0]['farmer_status_id'] == FarmerStatus::INACTIVE) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => []
                ];
            }

            $user = User::where(['username' => $farmer[0]['email'], 'profile' => LoginAction::FARMER])->first();

            $result = SaveFarmAction::handle($request, $user);

            if (!$result['status']) {
                return $result;
            }

            return ['status' => true, 'code' => 200,  'message' => 'Farm registered successfully.', 'data' => $result['data']];
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
