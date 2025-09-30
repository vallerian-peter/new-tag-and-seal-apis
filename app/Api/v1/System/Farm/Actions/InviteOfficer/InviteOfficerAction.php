<?php

namespace App\Api\v1\System\Farm\Actions\InviteOfficer;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Mail\SendExtensionOfficerFarmAssignmentEmail;
use App\Mail\SendExtensionOfficerInvitationEmail;
use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use App\Models\Farmer;
use App\Models\FarmerStatus;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class InviteOfficerAction
{
    public static function handle(Request $request)
    {
        try {
            DB::beginTransaction();

            //get farmer
            $farmer = Farmer::where(['farmer_no' => $request->farmerNo])->first();
            if (!$farmer) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Invalid farmer no provided',
                    'data' => []
                ];
            }

            //get farm
            $farm = Farm::where(['id' => $request->farmId])->first();
            if (!$farm) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Invalid farm provided',
                    'data' => []
                ];
            }

            //check if farmer is active
            if ($farmer['farmer_status_id'] != FarmerStatus::ACTIVE) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => []
                ];
            }

            $user = User::where(['username' => $farmer['email'], 'profile' => LoginAction::FARMER])->first();

            // Fetch the officer details where email or phone matches the submitted parameter
            $officer = ExtensionOfficer::where('email', $request->email)
                ->first();

            if (!$officer) {
                DB::rollBack();
                $farm_name = $farm->name;
                $farmer_name = $farmer->first_name. " " . $farmer->surname;
                Mail::to($request->email)->send(new SendExtensionOfficerInvitationEmail(
                    $farm_name,
                    $farmer_name
                ));
                return [
                    'status' => true,
                    'code' => 200,
                    'message' => 'Extension officer not found, but invited successfully.',
                    'data' => []
                ];
            }

            //check if extension officer already assigned
            $alreadyAssigned = ExtensionOfficerFarm::where('extension_officer_id', filter_var($officer->id, FILTER_VALIDATE_INT))
                ->where('farm_id', filter_var($request->farmId, FILTER_VALIDATE_INT))->exists();

            if ($alreadyAssigned) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'This Officer Has Already Been Assigned To This Farm', 'data' => []];
            }

            //Assign Officer
            $assign = ExtensionOfficerFarm::create([
                'extension_officer_id' => filter_var($officer->id, FILTER_VALIDATE_INT),
                'farm_id' => filter_var($request->farmId, FILTER_VALIDATE_INT),
                'created_at' => Carbon::now(),
                'state_id' => 1,
                'assigned_by' => $user->id
            ]);

            if (!$assign) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to assign extension officer', 'data' => []];
            }

            DB::commit();

            $farm_name = $farm->name;
            $farmer_name = $farmer->first_name. " " . $farmer->surname;
            $officer_name = $officer->name;
            Mail::to($request->email)->send(new SendExtensionOfficerFarmAssignmentEmail(
                $officer_name,
                $farm_name,
                $farmer_name
            ));

            return ['status' => true, 'code' => 200, 'message' => 'Extension officer assigned successfully.', 'data' => $officer];

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
