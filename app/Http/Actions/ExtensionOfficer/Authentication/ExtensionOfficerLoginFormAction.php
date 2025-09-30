<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ExtensionOfficerLoginFormAction
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
                ->select('extension_officers.*', 'farms.id as farm_id', 'farms.name as farm_name', 'livestocks.id as livestock_id',
                    'livestocks.name as livestock_name', )
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
                        'livestock_id'=> $officerDetail->livestock_id,
                        'livestock_name'=>$officerDetail->livestock_name
                    ];
                }
            }

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Extension officer logged in successfully.',
                'data' => [
                    'id' => $officer[0]->id,
                    'reg_no' => $officer[0]->registration_no,
                    'name' => $officer[0]->name,
                    'phone' => $officer[0]->phone_1,
                    'email' => $officer[0]->email,
                    'farms' => $farms,
                    'livestocks'=> $livestocks,
                    'token' => $token,
                ],
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
