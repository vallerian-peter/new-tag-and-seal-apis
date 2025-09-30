<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use App\Models\AuthorizationToken;
use App\Models\User;
use App\Models\ExtensionOfficer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ExtensionOfficerVerifyOtpFormAction
{
    public function handle(Request $request)
    {
        try {

            //get officer credential details
            $officer_logins = User::where('username', $request->email)->first();
            if (!$officer_logins) {
                return 
                    [
                     'status' => false,
                    'code' => 100,
                    'message' => 'Failed!.No record Found For The Specified Officer.',
                    'data' => []
                    ];
            }
            // Retrieve OTP record if active(NOT EXPIRED)
            $otpRecord = AuthorizationToken::where(
                'user_id', $officer_logins->id)
                ->orwhere('token', $request->otpValue)
                ->orwhere('expires_at', '>', now())->first();
            if (is_null($otpRecord)) {
                return 
                    [
                     'status' => false,
                     'code' => 100,
                     'message' => 'Failed. No Record found for the specified otp value.',
                    'data' => []
                    ];
            }

            // OTP is valid;
            //delete the OTP record
            $otpRecord->delete();

            //after successful OTP verification
            // Generate a token
            $token = Auth::login($officer_logins);
          
            return ['status' => true, 'code' => 200, 'message' => 'Otp Verified Successfuly', 'data' => $token];
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
