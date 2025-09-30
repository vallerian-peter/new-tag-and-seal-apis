<?php

namespace App\Http\Actions\Farmer\Dashboard;

use App\Models\ExtensionOfficer;
use App\Models\Farm;
use App\Models\Farmer;
use App\Models\FarmLivestockType;
use App\Models\FarmLivestock;
use App\Models\FarmTag;
use App\Models\LegalStatus;
use App\Models\SizeUnit;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class FarmerGetDashboardFormAction
{
    public function handle(Request $request)
    {
        //get farmer
        $farmer = Farmer::where(['farmer_no' => $request->farmer_no])->get();
        if (count($farmer) <= 0) {
            return [
                'status' => false,
                'code' => 100,
                'message' => 'Invalid farmer no provided',
                'data' => []
            ];
        }

        //check if farmer is active
        if ($farmer[0]['farmer_status_id'] != 1) {
            return [
                'status' => false,
                'code' => 100,
                'message' => 'Request Failed your account is not active',
                'data' => []
            ];
        }

        $getFarm = $this->getFarmDetails($request);
        if (!$getFarm['status']) {
            return [
                'status' => false,
                'code' => 100,
                'message' => $getFarm['message'],
                'data' => []
            ];
        }

        $farmDetails = $this->getFarmDetails($request);
		
        $livestockTypes = FarmLivestockType::join('livestock_types', 'livestock_types.id', '=', 'farm_livestock_types.livestock_type_id')
            ->where(['farm_livestock_types.state_id' => 1, 'farm_livestock_types.farm_id' => $farmDetails['data']['id']])
            ->select('livestock_types.id', 'livestock_types.name')
            ->get();
		$livestocks = FarmLivestock::join('livestocks', 'livestocks.id', 'farm_livestocks.livestock_id')
                ->join('livestock_types', 'livestock_types.id', '=', 'livestocks.livestock_type_id')
                ->join('genders', 'genders.id', '=', 'livestocks.gender_id')
                ->join('breeds', 'breeds.id', '=', 'livestocks.breed_id')
                ->join('species', 'species.id', '=', 'livestocks.species_id')
                ->join('livestock_statuses', 'livestock_statuses.id', '=', 'livestocks.livestock_status_id')
				->where('farm_livestocks.farm_id',$request->farm_id)
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

        $farmTags = FarmTag::join('tags', 'tags.id', '=', 'farm_tags.tag_id')
            ->leftjoin('tag_types', 'tag_types.id', '=', 'tags.tag_type_id')
            ->where(['farm_tags.farm_id' => $farmDetails['data']['id'], 'state_id' => 1])
            ->whereIn('tags.tag_status_id', [4])
            ->select('tags.id', 'tags.tag_number', 'tags.batch_serial_number', 'tag_types.id as tag_type_id', 'tag_types.name as tag_type')
            ->get();

        $userRoles = Role::whereNotIn('id', [1, 2, 4, 5, 6])->get();
        $extensionOfficers = ExtensionOfficer::where('status_id', 1)->select('id', 'name', 'phone_1', 'email')->get();
        $legalStatuses = LegalStatus::select('id', 'name')->get();
        $sizeUnits = SizeUnit::select('id', 'name')->get();

        $data = [
            'farm' => $farmDetails['data'],
            'livestockTypes' => $livestockTypes,
			'livestocks' => $livestocks,    
			'tags' => $farmTags,
            'userRoles' => $userRoles,
            'extensionOfficers' => $extensionOfficers,
            'legalStatuses' => $legalStatuses,
            'sizeUnits' => $sizeUnits
        ];

        return [
            'status' => true,
            'code' => 200,
            'message' => 'Farm dashboard data fetched successfully',
            'data' => $data
        ];
    }

    private function getFarmDetails($request)
    {
        $farm = Farm::where('id', $request->farm_id)->get();
        if (count($farm) <= 0) {
            return ['status' => false, 'message' => 'Invalid farm ID'];
        }

        $data = [
            'id' => $farm[0]['id'],
            'farm_no' => $farm[0]['reference_no'],
            'regional_reg_no' => $farm[0]['regional_reg_no'],
            'size' => $farm[0]['size'] . ' Acre(s)',
            'latitudes' => $farm[0]['latitudes'],
            'longitudes' => $farm[0]['longitudes'],
            'address' => $farm[0]['physical_address']
        ];

        return ['status' => true, 'code' => 200, 'message' => 'Farm fetched successfully.', 'data' => $data];
    }
}
