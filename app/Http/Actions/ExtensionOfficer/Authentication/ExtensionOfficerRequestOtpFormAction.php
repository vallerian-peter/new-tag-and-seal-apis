<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use App\Mail\SendExtensionOfficerRequestOtpMail;
use App\Models\AuthorizationToken;
use App\Models\ExtensionOfficer;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;


class ExtensionOfficerRequestOtpFormAction
{
    public function handle(Request $request)
    {
        try {

            DB::beginTransaction();

            //check if exists
            $exists = ExtensionOfficer::where('email', $request->email)->first();
            if (!$exists) {
                DB::rollBack();
                return
                    [
                    'status' => false,
                    'code' => 100,
                    'message' => "Failed!.Specified User's Records Not Found.",
                    'data' => [],
                ];
            }

            //Get Logins Details
            $get_Logins = User::query()->where('username', $exists->email)
                ->orWhere(function ($query) use ($exists) {
                    $query->where([
                        'profile_id' => $exists->id,
                        'profile' => 'ExtensionOfficer',
                    ]);
                })->first();
                     
            //Generate Otp
            $token = random_int(1000, 9999);
            //create new record if no record exist for the specified officer or update otp and expire time if record exist
            $Otp = AuthorizationToken::updateOrCreate([
                'user_id' => $get_Logins->id,
                'profile' => 'ExtensionOfficer'],
                ['token' => $token,
                'expires_at' => now()->addMinutes(3)]
            );

            $token = Auth::login($get_Logins);
            $data = [
                'otp' => $Otp->token,
                'number' => $exists->registration_no,
                'username' => $exists->email,
                'password' => $exists->email,
                'verificationToken' => $token,
            ];
            DB::commit();
            $officer_name = $exists->name;
            $otp = $Otp->token;
            $username = $exists->email;
            $password = $exists->email;

            Mail::to($request->email)->send(new SendExtensionOfficerRequestOtpMail(
                $officer_name,
                $otp,
                $username,
                $password
            ));

            return ['status' => true, 'code' => 200, 'message' => 'OTP Details Sent successfully.', 'data' => $data];

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
