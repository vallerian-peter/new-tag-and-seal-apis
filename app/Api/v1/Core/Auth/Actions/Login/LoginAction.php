<?php

namespace App\Api\v1\Core\Auth\Actions\Login;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class LoginAction
{
    CONST FARMER = 'Farmer';
    CONST EXTENSION_OFFICER = 'ExtensionOfficer';
    CONST SYSTEM_USER = 'SystemUser';
    CONST FARM_USER = 'FarmUser';
    public static function handle(Request $request, $loginType)
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

            if ($profile != $loginType) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Access denied. You are not a farmer.',
                    'data' => [],
                ];
            }

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Farmer logged in successfully.',
                'data' => [
                    'user' => $user,
                    'token' => $token,
                ],
            ];

        } catch (\Exception $ex) {
            Log::error($ex->getMessage());
            Log::error($ex->getTraceAsString());
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => [],
            ];
        }
    }
}
