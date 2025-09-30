<?php

namespace App\Http\Actions\ExtensionOfficer\Farmer;

use App\Models\ExtensionOfficer;
use App\Models\Farmer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Storage;
use App\Models\Attachment;
use App\Models\FarmerAttachment;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;

class ExtensionOfficerRegisterFarmerFormAction
{
    public function handle(Request $request)
    {
        try {
            DB::beginTransaction();
            $user = Auth::user();
            //get officer
            $officer = ExtensionOfficer::where('id',$user->profile_id)->first();
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
                'created_by'=>$officer->id,
                'created_at' => Carbon::now(),
                'farmer_status_id' => 1,
                'is_verified' => false
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save farmer details', 'data' => []];
            }

            // //upload farmer passport
            $save_attachment = $this->saveFarmerAttachment($save, $request);
            if (!$save_attachment['status']) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => $save_attachment['message'], 'data' => []];
            }

            //save login credentials
            $login_details = [
                'username' => $save->email,
                'password' => bcrypt($save->email),
                'profile' => 'Farmer',
                'profile_id' => $save->id,
                'status_id' => 1,
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

    private function saveFarmerAttachment($farmer, $request)
    {
        $files = $request->passport_picture;
        $attachment_types = [1];

        if (!is_null($files)) {
            for ($i = 0; $i < count($files); $i++) {
                $fileName = hrtime()[1] . '.' . $request->passport_picture[$i]->extension();
                $fileSize = $request->passport_picture[$i]->getSize();

                $filePath = 'uploads/' . $fileName;

                $path = Storage::disk('attachments')->put($filePath, file_get_contents($request->passport_picture[$i]));
                $path = Storage::url($fileName);

                $saveAttachment = Attachment::create([
                    'name' => $fileName,
                    'path' => $path,
                    'size' => $fileSize,
                    'attachment_type_id' => $attachment_types[$i],
                    'created_at' =>  Carbon::now(),
                ]);
                if (!$saveAttachment) {
                    return ['status' => false, 'message' => 'Failed to create farmer passport size attachment.'];
                }

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
        }
        return ['status' => true, 'message' => 'Farmer attachment uploaded successfully.'];
    }
}
