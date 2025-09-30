<?php

namespace App\Http\Actions\ExtensionOfficer\Dashboard;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\FarmLivestock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ExtensionOfficerGetDashboardFormAction
{
    public function handle(Request $request)
    {
        try {

            $user = Auth::user();

            //get officer
            $officer = ExtensionOfficer::where('email', $user->username)->get();

            if (count($officer) <= 0) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Failed, No record found for the specified Officer',
                    'data' => [],
                ];
            }

            //check if officer is active
            if ($officer[0]['status_id'] != 1) {
                return [
                    'status' => false,
                    'code' => 100,
                    'message' => 'Request Failed your account is not active',
                    'data' => [],
                ];
            }

            //get farms
            $farms = ExtensionOfficerFarm::where('extension_officer_id', $officer[0]->id)->get();


            $livestocks = FarmLivestock::join('livestocks', 'livestocks.id', 'farm_livestocks.livestock_id')
                ->join('livestock_types', 'livestock_types.id', '=', 'livestocks.livestock_type_id')
                ->join('genders', 'genders.id', '=', 'livestocks.gender_id')
                ->join('breeds', 'breeds.id', '=', 'livestocks.breed_id')
                ->join('species', 'species.id', '=', 'livestocks.species_id')
                ->join('livestock_statuses', 'livestock_statuses.id', '=', 'livestocks.livestock_status_id')
                ->join('extension_officer_farms', 'extension_officer_farms.farm_id', '=', 'farm_livestocks.farm_id')
                ->where('extension_officer_farms.extension_officer_id', $officer[0]->id)
                ->select(
                    'livestocks.id',
                    'livestocks.name',
                    'livestocks.identification_number as nida',
                    'livestocks.date_of_birth',
                    'genders.name as gender',
                    'breeds.name as breed',
                    'species.name as species',
                    'livestock_statuses.name as status'
                )
                ->get();

            $data = [
                'highlights' =>
                [
                    [
                        'title' => 'Registered Cattle',
                        'value' => count($livestocks),

                    ],
                    [
                        'title' => 'Attended Farms',
                        'value' => count($farms),
                    ],
                ],

            ];

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Extension Officer dashboard data fetched successfully',
                'data' => $data,
            ];
        } catch (\Exception $ex) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $ex->getMessage(),
                'data' => [],
            ];
        }
    }

}
