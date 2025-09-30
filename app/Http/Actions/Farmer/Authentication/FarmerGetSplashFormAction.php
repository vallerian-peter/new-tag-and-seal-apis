<?php

namespace App\Http\Actions\Farmer\Authentication;

use App\Models\Breed;
use App\Models\District;
use App\Models\EducationLevel;
use App\Models\FarmerType;
use App\Models\Gender;
use App\Models\LivestockType;
use App\Models\Region;
use App\Models\Specie;
use App\Models\Stage;
use App\Models\TagType;
use App\Models\Ward;
use Illuminate\Http\Request;
use App\Models\IdentityCardType;
use App\Models\MilkingMethod;
use App\Models\MilkingSession;
use App\Models\MilkingUnit;
use App\Models\Vaccine;
use App\Models\Disease;
use Spatie\Permission\Models\Role;

class FarmerGetSplashFormAction
{
    public function handle(Request $request)
    {

        $genders = Gender::select('id', 'name', 'short_name')->get();
        $breeds = Breed::select('id', 'name', 'livestock_type_id')->get();
        $species = Specie::select('id', 'name')->get();
        $livestockStages = Stage::select('id', 'name')->get();
        $regions = Region::select('id', 'name', 'abbreviation')->get();
        $districts = District::select('id', 'name', 'region_id')->get();
        $wards = Ward::select('id', 'name', 'district_id')->get();
        $tagTypes = TagType::select('id', 'name')->get();
        $livestockTypes = LivestockType::select('id', 'name')->get();
        $farmerType = FarmerType::select('id', 'name')->get();
        $idCardType = IdentityCardType::select('id', 'name')->get();
        $educationLevels = EducationLevel::select('id', 'name')->get();
        $vaccines = Vaccine::select('id', 'name')->get();
        $diseases = Disease::select('id', 'name')->get();
        $milkingMethods = MilkingMethod::select('id', 'name')->get();
        $milkingSessions = MilkingSession::select('id','name')->get();
        $milkingUnits = MilkingUnit::select('id','name')->get();
        $userRoles = Role::whereNotIn('id', [1, 2, 3, 4, 5, 6])
        ->select('id','name')->get();

        $data = [
            'livestockTypes' => $livestockTypes,
            'genders' => $genders,
            'breeds' => $breeds,
            'species' => $species,
            'livestockStages' => $livestockStages,
            'tagTypes' => $tagTypes,
            'regions' => $regions,
            'districts' => $districts,
            'wards' => $wards,
            'farmerType' => $farmerType,
            'idCardType' => $idCardType,
            'educationLevels' => $educationLevels,
            'userRoles'=>$userRoles,
            'vaccines'=> $vaccines,
            'diseases'=> $diseases,
            'milkingMethods'=>$milkingMethods,
            'milkingSessions'=> $milkingSessions,
            'milkingUnits'=>$milkingUnits
        ];

        return [
            'status' => true,
            'code' => 200,
            'message' => 'Farm splash data fetched successfully',
            'data' => $data
        ];
    }
}
