<?php

namespace App\Api\v1\System\Farm\Actions\GetFarmUsers;

use App\Models\Farm;
use App\Models\FarmUser;
use App\Models\SystemUser;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GetFarmUsersAction
{
    public static function handle($request)
    {
        try {
            $user = Auth::user();

            if (!$user) {
                return [
                    'status' => false,
                    'code' => 401,
                    'message' => 'Unauthorized',
                    'data' => []
                ];
            }

            // Get farm ID from request
            $farmId = $request->farmId ?? $request->farm_id;

            if (!$farmId) {
                return [
                    'status' => false,
                    'code' => 400,
                    'message' => 'Farm ID is required',
                    'data' => []
                ];
            }

            // Verify the farm belongs to the authenticated user
            $farm = Farm::where(['id' => $farmId, 'created_by' => $user->id])->first();

            if (!$farm) {
                return [
                    'status' => false,
                    'code' => 403,
                    'message' => 'Farm not found or access denied',
                    'data' => []
                ];
            }

            // Get farm users with related data
            $farmUsers = FarmUser::with(['user.systemUser', 'assignedByUser.systemUser'])
                ->where('farm_id', $farmId)
                ->get()
                ->map(function ($farmUser) use ($farm) {
                    $systemUser = $farmUser->user->systemUser ?? null;
                    $assignedBy = $farmUser->assignedByUser->systemUser ?? null;

                    // Get assigned by name from farmer if it's a farmer user
                    $assignedByName = '';
                    if ($assignedBy) {
                        $assignedByName = $assignedBy->name ?? '';
                    } else {
                        // If no systemUser, try to get from farmer table
                        $farmer = \App\Models\Farmer::where('id', $farmUser->assigned_by)->first();
                        if ($farmer) {
                            $assignedByName = $farmer->first_name . ' ' . $farmer->surname;
                        }
                    }

                    return [
                        'id' => $farmUser->id,
                        'farm_id' => $farmUser->farm_id,
                        'farm_name' => $farm->name,
                        'user_id' => $farmUser->user_id,
                        'name' => $systemUser->name ?? '',
                        'email' => $systemUser->email ?? '',
                        'phone' => $systemUser->phone ?? '',
                        'address' => $systemUser->address ?? '',
                        'role' => $farmUser->role ?? '',
                        'assigned_by' => $farmUser->assigned_by,
                        'assigned_by_name' => $assignedByName,
                        'state' => $farmUser->state_id == 1 ? 'Active' : 'Inactive',
                        'created_at' => $farmUser->created_at->toISOString(),
                        'updated_at' => $farmUser->updated_at ? $farmUser->updated_at->toISOString() : null,
                    ];
                });

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Farm users retrieved successfully',
                'data' => $farmUsers
            ];

        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ];
        }
    }
}
