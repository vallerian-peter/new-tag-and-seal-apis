<?php

namespace App\Api\v1\System\Farmer\Actions\Login;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FarmerLoginAction
{
    public static function handle(Request $request)
    {
        $result = LoginAction::handle($request, LoginAction::FARMER);
        if (!$result['status']) {
            return $result;
        }

        $data = $result['data'];

        //get farmer
        $farmer = DB::table('farmers')
            ->leftJoin('farm_owners', 'farmers.id', '=', 'farm_owners.farmer_id')
            ->leftJoin('farms', 'farm_owners.farm_id', '=', 'farms.id')
            ->select(
                'farmers.id as farmer_id',
                'farmers.farmer_status_id',
                'farmers.farmer_no as farmer_no',
                'farmers.first_name as first_name',
                'farmers.middle_name as middle_name',
                'farmers.surname as surname',
                'farmers.phone_1 as phone_1',
                'farmers.email as email',
                'farms.*'
            )
            ->where('farmers.id', $data['user']->profile_id)
            ->get();

        //Check if farmer is present and has required records.
        if (!$farmer) {
            return [
                'status' => false,
                'code' => 401,
                'message' => 'Farmer not found',
                'data' => []
            ];
        }

        // Get the farmer details from the first row
        $farmerDetails = [
            'id' => $farmer[0]->farmer_id,
            'farmer_no' => $farmer[0]->farmer_no,
            'first_name' => $farmer[0]->first_name,
            'middle_name' => $farmer[0]->middle_name,
            'surname' => $farmer[0]->surname,
            'phone_1' => $farmer[0]->phone_1,
            'email' => $farmer[0]->email,
        ];

        //get farm details
        $farms = [];
        foreach ($farmer as $farmerDetail) {
            if (!is_null($farmerDetail->id)) {
                $farms[] = [
                    'farm_id' => $farmerDetail->id,
                    'farm_name' => $farmerDetail->name,
                ];
            }
        }

        return [
            'status' => true,
            'code' => 200,
            'message' => 'Farmer logged in successfully.',
            'data' => [
                'id' => $farmerDetails['id'],
                'farmer_no' => $farmerDetails['farmer_no'],
                'name' => $farmerDetails['first_name'] . ' ' . $farmerDetails['middle_name'] . ' ' . $farmerDetails['surname'],
                'phone' => $farmerDetails['phone_1'],
                'email' => $farmerDetails['email'],
                'farms' => $farms,
                'token' => $data['token'],
            ],
        ];
    }
}
