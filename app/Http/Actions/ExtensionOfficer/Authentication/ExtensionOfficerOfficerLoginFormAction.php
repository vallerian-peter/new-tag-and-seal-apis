<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Namshi\JOSE\JWT;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;

class ExtensionOfficerOfficerLoginFormAction
{
    public function handle(Request $request)
    {
        try {
            $credentials = $request->only('username', 'password');
            $token = Auth::attempt($credentials);
            if (!$token) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Invalid username or password',
                    'data' => [],
                ];
            }

            $rememberMe = $request->input('rememberMe',false);
            if($rememberMe){
                //extend token expiration duration
                JWTAuth::factory()->setTTL(10080);
            }
            $user = Auth::user();
            //check user profile
            $profile = $user->profile;

            if ($profile != 'ExtensionOfficer') {
                return response()->json([
                    'status' => false,
                    'code' => 100,
                    'message' => 'Access denied. You are not an extension officer.',
                    'data' => [],
                ]);
            }

            //get officer
            $officer = DB::table('extension_officers')
                ->leftJoin('extension_officer_farms', 'extension_officers.id', '=', 'extension_officer_farms.extension_officer_id')
                ->leftJoin('farms', 'extension_officer_farms.farm_id', '=', 'farms.id')
                ->leftJoin('farm_livestocks', 'farms.id', '=', 'farm_livestocks.farm_id')
                ->leftJoin('livestocks', 'farm_livestocks.livestock_id', '=', 'livestocks.id')
                ->leftJoin('school_levels','extension_officers.school_level_id','=','school_levels.id')
                ->leftJoin('countries','extension_officers.country_id', '=','countries.id')
                ->leftJoin('regions','extension_officers.region_id', '=','regions.id') 
                ->leftJoin('districts','extension_officers.district_id', '=','districts.id')
                ->select('extension_officers.*', 'farms.id as farm_id', 'farms.name as farm_name', 'livestocks.id as livestock_id',
                    'livestocks.name as livestock_name','countries.name as country','regions.name as region','districts.name as district','school_levels.name as designation')
                ->where('extension_officers.id', $user->profile_id)
                ->get();
            //check if farmer is active
            if ($officer[0]->status_id != 1) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => [],
                ];
            }

            //get farms
            $farms = [];
            foreach ($officer as $officerDetail) {
                if (!is_null($officerDetail->farm_id)) {
                    $farms[] = [
                        'farm_id' => $officerDetail->farm_id,
                        'farm_name' => $officerDetail->farm_name,
                    ];
                }
            }

            //get livestock
            $livestocks = [];
            foreach ($officer as $officerDetail) {
                if (!is_null($officerDetail->livestock_id)) {

                    $livestocks[] = [
                        'livestock_id' => $officerDetail->livestock_id,
                        'livestock_name' => $officerDetail->livestock_name,
                    ];
                }
            }
            $details =[
                'id'=>$officer[0]->id,
            "name"=> $officer[0]->name,
            "number"=> $officer[0]->registration_no,
            "phone"=>$officer[0]->phone_1,
            "email"=>$officer[0]->email,
            "designation"=> $officer[0]->designation
            ];
            $assigned = [
                'country'=>$officer[0]->country,
                'region'=>$officer[0]->region,
                'district'=>$officer[0]->district,
                'location'=>$officer[0]->address
            ];
            return [
                'status' => true,
                'code' => 200,
                'message' => 'Extension officer logged in successfully.',
                'data' => [
                    'details' => $details,
                    'accessToken' => $token,
                    'assigned'=>$assigned,
                    'farms'=>$farms,
                    'livestocks'=>$livestocks
                ]
            ];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => [],
            ];
        }
    }
}
