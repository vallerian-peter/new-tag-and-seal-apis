<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\ExtensionOfficer;
use Illuminate\Support\Carbon;
use App\Models\Attachment;
use App\Models\ExtensionOfficerAttachment;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use Spatie\Permission\Models\Role;

class SaveExtensionOfficerRegistrationFormAction
{
    public function handle(Request $request)
    {
        try {

            DB::beginTransaction();

            //check if exists
            $exists  = ExtensionOfficer::where('phone_1', $request->phone_1)->orWhere('phone_2', $request->phone_2)->orWhere('email',$request->email)->get();
            if (count($exists) > 0) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Extension Officer details already exists', 'data' => []];
            }

            //save ExtensionOfficer
            $save = ExtensionOfficer::create([
                'registration_no' => 'EXF' . hrtime()[1],
                'name' => htmlspecialchars($request->name),
                'phone_1' => $request->phone_1 ?? '',
                'phone_2' => $request->phone_2 ?? '',
                'email' => $request->email,
                'address' => $request->address,
                'medical_licence_no' => $request->medical_licence_no,
                'date_of_birth' => $request->dob,
                'gender_id' => $request->gender,
                'identity_card_type_id' => $request->id_card_type,
                'identity_number' => $request->id_number,
                'school_level_id' => $request->education_level,
                'country_id' => $request->country,
                'region_id' => $request->region,
                'district_id' => $request->district,
                'created_at' => Carbon::now(),
                'status_id' => 1,
                'is_verified' => true
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to register new extension officer', 'data' => []];
            }

            //save login credentials
            $login_details = [
                'username' => $save->email,
                'password' => bcrypt($save->email),
                'profile' => 'ExtensionOfficer',
                'profile_id' => $save->id,
                'status_id' => 1,
                'created_at' => Carbon::now(),
                'state_id' => 1
            ];

            $saveLogins = User::create($login_details);
            if (!$saveLogins) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to save extension officer logins', 'data' => []];
            }

            //assign extension officer group
            $role = Role::where(['name' => 'extension-officer'])->first();

            //Assign role for extensionofficer
            $assign = DB::table('model_has_roles')->insert([
                'role_id' => $role->id,
                'model_type' => 'App\Models\User',
                'model_id' => $saveLogins->id
            ]);

            if (!$assign) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to assign role', 'data' => []];
            }

            //save extensionofficer attachments
            $save_attachment = $this->saveExtensionOfficerAttachment($save, $request);
            if (!$save_attachment['status']) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => $save_attachment['message'], 'data' => []];
            }

            DB::commit();
            return ['status' => true, 'code' => 200, 'message' => 'Extension officer created successfully.', 'data' => $save];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => []
            ];
        }
    }

    private function saveExtensionOfficerAttachment($extensionofficer, $request)
    {
        $files = $request->passport_picture;
        $attachment_types = [1];

        if (!is_null($files)) {
            for ($i = 0; $i < count($files); $i++) {

                $fileName = hrtime()[1] . '.' . $request->passport_picture[$i]->extension();

                $filePath = 'uploads/' . $fileName;

                $path = Storage::disk('attachments')->put($filePath, file_get_contents($request->passport_picture[$i]));
                $path = Storage::url($fileName);

                $saveAttachment = Attachment::create([
                    'name' => $fileName,
                    'path' => $path,
                    'size' => '',
                    'attachment_type_id' => $attachment_types[$i],
                    'created_at' =>  Carbon::now(),
                ]);
                if (!$saveAttachment) {
                    return ['status' => false, 'message' => 'Failed to create extension officer passport size attachment.'];
                }

                //save extension officer attachment
                $saveExtensionOfficererianryAttachment = ExtensionOfficerAttachment::create([
                    'extension_officer_id' => $extensionofficer->id,
                    'attachment_id' => $saveAttachment->id,
                    'state_id' => 1,
                ]);

                if (!$saveExtensionOfficererianryAttachment) {
                    return ['status' => false, 'message' => 'Failed to save extension officer passport size attachment.'];
                }
            }
        }

        return ['status' => true, 'message' => 'Extension officer attachment uploaded successfully.'];
    }
}
