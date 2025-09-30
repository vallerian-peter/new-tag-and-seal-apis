<?php

namespace App\Api\v1\System\Farm\Actions\GetExtensionOfficers;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class GetExtensionOfficersAction
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

            // Get extension officers assigned to this farm with proper joins and email verification check
            $extensionOfficers = ExtensionOfficerFarm::with(['extensionOfficer', 'assignedByUser.systemUser'])
                ->whereHas('extensionOfficer', function ($query) {
                    $query->where('is_verified', 1); // Only verified officers
                })
                ->where('farm_id', $farmId)
                ->get()
                ->map(function ($assignment) use ($farm) {
                    $officer = $assignment->extensionOfficer;
                    $assignedBy = $assignment->assignedByUser->systemUser ?? null;

                    // Get assigned by name from farmer if it's a farmer user
                    $assignedByName = '';
                    if ($assignedBy) {
                        $assignedByName = $assignedBy->name ?? '';
                    } else {
                        // If no systemUser, try to get from farmer table
                        $farmer = \App\Models\Farmer::where('id', $assignment->assigned_by)->first();
                        if ($farmer) {
                            $assignedByName = $farmer->first_name . ' ' . $farmer->surname;
                        }
                    }

                    return [
                        'id' => $assignment->id,
                        'farm_id' => $assignment->farm_id,
                        'farm_name' => $farm->name,
                        'officer_id' => $officer->id,
                        'registration_no' => $officer->registration_no ?? '',
                        'name' => $officer->name ?? '',
                        'email' => $officer->email ?? '',
                        'phone_1' => $officer->phone_1 ?? '',
                        'phone_2' => $officer->phone_2 ?? '',
                        'address' => $officer->address ?? '',
                        'medical_licence_no' => $officer->medical_licence_no ?? '',
                        'is_verified' => $officer->is_verified ?? 0,
                        'assigned_by' => $assignment->assigned_by,
                        'assigned_by_name' => $assignedByName,
                        'state' => $assignment->state_id == 1 ? 'Active' : 'Inactive',
                        'created_at' => $assignment->created_at->toISOString(),
                        'updated_at' => $assignment->updated_at ? $assignment->updated_at->toISOString() : null,
                    ];
                });

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Extension officers retrieved successfully',
                'data' => $extensionOfficers
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
