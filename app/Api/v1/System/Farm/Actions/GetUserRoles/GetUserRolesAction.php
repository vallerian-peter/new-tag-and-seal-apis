<?php

namespace App\Api\v1\System\Farm\Actions\GetUserRoles;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class GetUserRolesAction
{
    public static function handle(Request $request)
    {
        try {
            // Get all user roles from the system
            $roles = Role::all()->map(function ($role) {
                return [
                    'id' => $role->id,
                    'name' => $role->name
                ];
            });

            return [
                'status' => true,
                'code' => 200,
                'message' => 'User roles retrieved successfully',
                'data' => $roles
            ];

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

