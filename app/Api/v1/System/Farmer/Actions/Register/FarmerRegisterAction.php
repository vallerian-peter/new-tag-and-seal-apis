<?php

namespace App\Api\v1\System\Farmer\Actions\Register;

use App\Api\v1\_Src\Helpers;
use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Models\AttachmentType;
use App\Models\Farmer;
use App\Models\FarmerAttachment;
use App\Models\FarmerStatus;
use App\Models\Status;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class FarmerRegisterAction
{
    public static function handle(Request $request)
    {
        try {
            DB::beginTransaction();

            //check farmer exists
            $exists = Farmer::where(['email' => $request->email])->orWhere('phone_1', $request->phone_1 ?? '')->get();

            if (count($exists) > 0) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Farm Owner with this phone number or email already taken', 'data' => []];
            }

            //save farmer
            $save = Farmer::create([
                'farmer_no' => 'FM' . hrtime()[1],
                'first_name' => htmlspecialchars($request->first_name),
                'middle_name' => htmlspecialchars($request->middle_name ?? ''),
                'surname' => htmlspecialchars($request->surname ?? ''),
                'phone_1' => $request->phone_1 ?? '',
                'phone_2' => $request->phone_2 ?? '',
                'email' => $request->email ?? '',
                'physical_address' => htmlspecialchars($request->address),
                'farmer_type_id' => filter_var($request->farmer_type, FILTER_VALIDATE_INT),
                'date_of_birth' => $request->dob,
                'gender_id' => filter_var($request->gender, FILTER_VALIDATE_INT),
                'identity_card_type_id' => filter_var($request->id_card_type, FILTER_VALIDATE_INT),
                'identity_number' => $request->id_number,
                'farmer_organization_membership' => $request->farmer_organization_membership ?? '',
                'school_level_id' => $request->education_level,
                'region_id' => $request->region,
                'district_id' => $request->district,
                'ward_id' => $request->ward,
                'created_by'=> $request->created_by ?? null,
                'created_at' => Carbon::now(),
                'farmer_status_id' => FarmerStatus::ACTIVE,
                'is_verified' => false
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farmer details', 'data' => []];
            }

            // //upload farmer passport
            $save_attachment = self::saveFarmerAttachment($save, $request);
            if (!$save_attachment['status']) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => $save_attachment['message'], 'data' => []];
            }

            //save login credentials
            $login_details = [
                'username' => $save->email,
                'password' => bcrypt($save->email),
                'profile' => LoginAction::FARMER,
                'profile_id' => $save->id,
                'status_id' => Status::PENDING,
                'created_at' => Carbon::now(),
                'state_id' => 1
            ];

            $saveLogins = User::create($login_details);
            if (!$saveLogins) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farmer logins', 'data' => []];
            }

            //assign farmer farmer
            $role = Role::where(['name' => 'farmer'])->first();

            // $assign = $saveLogins->assignRole($role->name);
            $assign = DB::table('model_has_roles')->insert([
                'role_id' => $role->id,
                'model_type' => 'App\Models\User',
                'model_id' => $saveLogins->id
            ]);
            if (!$assign) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farmer role', 'data' => []];
            }

            $save->created_by = $saveLogins->id;
            $save->save();

            DB::commit();
            return ['status' => true, 'code' => 200, 'message' => 'Farmer created successfully.', 'data' => $save];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => []
            ];
        }
    }

    private static function saveFarmerAttachment($farmer, $request)
    {
        $files = $request->passport_picture;

        $result = Helpers::saveAttachment($files, AttachmentType::PASSPORT_ATTACHMENT_TYPE);
        if (!$result['status']) {
            return $result;
        }

        foreach ($result['data'] as $saveAttachment) {
            //save farmer attachment
            $saveFarmerAttachment = FarmerAttachment::create([
                'farmer_id' => $farmer->id,
                'attachment_id' => $saveAttachment->id,
                'state_id' => 1,
            ]);
            if (!$saveFarmerAttachment) {
                return ['status' => false, 'message' => 'Failed to save farmer passport size attachment.'];
            }
        }

        return ['status' => true, 'message' => 'Farmer attachment uploaded successfully.'];
    }
}
