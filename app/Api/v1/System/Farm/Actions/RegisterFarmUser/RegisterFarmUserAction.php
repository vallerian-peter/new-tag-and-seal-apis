<?php

namespace App\Api\v1\System\Farm\Actions\RegisterFarmUser;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use App\Mail\SendFarmUserNotificationEmail;
use App\Models\Farm;
use App\Models\Farmer;
use App\Models\FarmerStatus;
use App\Models\FarmUser;
use App\Models\State;
use App\Models\Status;
use App\Models\SystemUser;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Spatie\Permission\Models\Role;

class RegisterFarmUserAction
{

    public static function handle($request)
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

            //check if farmer is active
            if ($farmer['farmer_status_id'] != FarmerStatus::ACTIVE) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
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
            $user = User::where(['username' => $farmer['email'], 'profile' => LoginAction::FARMER])->first();

            //check if user exists
            $userExists = SystemUser::where(['phone' => $request->phone])->orWhere(['email' => $request->email])->get();

            if (count($userExists) > 0) {
                DB::rollBack();
                return ['status' => false,  'code' => 100, 'message' => 'User details already exists', 'data' => []];
            }

            //create user
            $save = SystemUser::create([
                'name' => htmlspecialchars($request->name),
                'email' => $request->email,
                'phone' => $request->phone,
                'address' => $request->address,
                'created_by' => $user->id,
                'created_at' => Carbon::now(),
                'status_id' => Status::ACTIVE
            ]);
            if (!$save) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to register farm user', 'data' => []];
            }

            //save user logins
            $saveUser = User::create([
                'username' => $request->email,
                'password' => bcrypt($request->email),
                'created_at' => Carbon::now(),
                'created_by' => $user->id,
                'profile' => LoginAction::FARM_USER,
                'profile_id' => $save->id,
                'status_id' => Status::ACTIVE
            ]);

            //save user farm
            $save_user_farm = FarmUser::create([
                'farm_id' => $request->farmId,
                'user_id' => $saveUser->id,
                'assigned_by' => $user->id,
                'state_id' => State::ACTIVE,
                'role' => $request->role,
                'created_at' => Carbon::now()
            ]);

            if (!$save_user_farm) {
                DB::rollBack();
                return ['status' => false, 'code' => 100, 'message' => 'Failed to register farm user', 'data' => []];
            }

            $role = Role::where(['name' => $request->role])->first();
            //Assign role
            $assign = DB::table('model_has_roles')->insert([
                'role_id' => $role->id,
                'model_type' => 'App\Models\User',
                'model_id' => $saveUser->id
            ]);

            if (!$assign) {
                DB::rollBack();
                return ['status' => false, 'code' => 100,  'message' => 'Failed to register farm user', 'data' => []];
            }

            DB::commit();
            $farm_user_name = $save->name;
            $farm_name = $farm->name;
            $farmer_name = $farmer->first_name. " " . $farmer->surname;
            $username = $request->email;
            $password = $request->email;
            Mail::to($request->email)->send(new SendFarmUserNotificationEmail(
                $farm_user_name,
                $farm_name,
                $farmer_name,
                $username,
                $password
            ));
            return ['status' => true, 'code' => 200, 'message' => 'Farm user registered successfully.', 'data' => $save];


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
