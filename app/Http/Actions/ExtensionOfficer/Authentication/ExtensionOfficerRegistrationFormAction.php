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
use SebastianBergmann\Type\FalseType;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Auth;


class ExtensionOfficerRegistrationFormAction
{
    public function handle(Request $request)
    {
        try {

            DB::beginTransaction();

            //check if exists
            $exists  = ExtensionOfficer::where('phone_1', $request->phone)->orWhere('email',$request->email)->get();
            if (count($exists) > 0) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Extension Officer details already exists', 'data' => []];
            }

            //save ExtensionOfficer
            $save = ExtensionOfficer::create([
                'registration_no' => 'EXF' . hrtime()[1],
                'phone_1' => $request->phone ?? '',
                'email' => $request->email,
                'medical_licence_no' => $request->medicalLicenceNumber,
                'created_at' => Carbon::now(),
                'status_id' => 1,
                'is_verified' => false
            ]);

            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to register new extension officer', 'data' => []];
            }

            //save login credentials
            $login_details = [
                'username' => $save->email,
                'password' => bcrypt($request->password),
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
            $token = Auth::login($saveLogins);

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
            $details=[
                'token'=>$token,
                'id'=>$save->id,
                'regNumber'=>$save->registration_no,
                'email'=>$save->email
            ];
            DB::commit();
            return ['status' => true, 'code' => 200, 'message' => 'Extension officer created successfully.', 'data' => $details];
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
