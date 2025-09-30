<?php
namespace App\Api\v1\System\Farm\Actions\Login;

use App\Api\v1\Core\Auth\Actions\Login\LoginAction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FarmUserLoginAction
{
    public static function handle(Request $request)
    {
        $result = LoginAction::handle($request, LoginAction::FARM_USER);
        if (!$result['status']) {
            return $result;
        }

        $data = $result['data'];
        $user = $data['user'];

        // join farm_users to find assignment and role
        $assignment = DB::table('farm_users')
            ->leftJoin('farms', 'farm_users.farm_id', '=', 'farms.id')
            ->select('farm_users.farm_id', 'farm_users.role', 'farms.name as farm_name')
            ->where('farm_users.user_id', $user->id)
            ->where('farm_users.state_id', 1)
            ->first();

        return [
            'status' => true,
            'code' => 200,
            'message' => 'Farm user logged in successfully.',
            'data' => [
                'id' => $user->id,
                'name' => optional($user->systemUser)->name,
                'email' => $user->username,
                'farm_user' => $assignment ? [
                    'farm_id' => $assignment->farm_id,
                    'farm_name' => $assignment->farm_name,
                    'role' => $assignment->role,
                ] : null,
                'token' => $data['token'],
            ],
        ];
    }
}


