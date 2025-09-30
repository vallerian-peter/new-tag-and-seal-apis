<?php

namespace App\Http\Actions\ExtensionOfficer\Authentication;

use App\Models\FarmerType;
use App\Models\LivestockObtainedMethod;
use App\Models\Medicine;
use Illuminate\Http\Request;
use App\Models\Gender;
use App\Models\SizeUnit;
use App\Models\LegalStatus;
use App\Models\Breed;
use App\Models\Specie;
use App\Models\Stage;
use App\Models\Region;
use App\Models\District;
use App\Models\IdentityCardType;
use App\Models\Ward;
use App\Models\TagType;
use App\Models\LivestockType;
use App\Models\EducationLevel;
use App\Models\Vaccine;
use App\Models\Disease;
use App\Models\MilkingMethod;
use App\Models\MilkingSession;
use App\Models\MilkingUnit;
use App\Models\MedicineQuantityUnit;
use App\Models\WithdrawPeriodUnit;
use App\Models\AdministrationRoute;
use App\Models\FeedingType;
use App\Models\AnimalDisposalType;
class ExtensionOfficerGetSplashFormAction
{
    public function handle(Request $request)
    {
        try {
            $genders = Gender::select('id', 'name', 'short_name')->get();
            $breeds = Breed::select('id', 'name', 'livestock_type_id')->get();
            $species = Specie::select('id', 'name')->get();
            $livestockStages = Stage::select('id', 'name')->get();
            $livestockMethodObtained = LivestockObtainedMethod::select('id','name')->get();
            $farmerType = FarmerType::select('id','name')->get();
            $regions = Region::select('id', 'name', 'abbreviation')->get();
            $districts = District::select('id', 'name', 'region_id')->get();
            $wards = Ward::select('id', 'name', 'district_id')->get();
            $tagTypes = TagType::select('id', 'name')->get();
            $livestockTypes = LivestockType::select('id', 'name')->get();
            $idCardType = IdentityCardType::select('id', 'name')->get();
            $educationLevels = EducationLevel::select('id', 'name')->get();
            $vaccines = Vaccine::select('id', 'name')->get(); 
            $diseases = Disease::select('id', 'name')->get(); 
            $milkingMethods = MilkingMethod::select('id', 'name')->get();
            $milkingSessions = MilkingSession::select('id','name')->get();
            $milkingUnits = MilkingUnit::select('id','name')->get();
            $medicineUnits = MedicineQuantityUnit::select('id','name')->get();
            $withdrawPeriodUnits = WithdrawPeriodUnit::select('id','name')->get();
            $medicine = Medicine::select('id','name')->get();
            $administrationRoutes = AdministrationRoute::select('id','name')->get();
            $feedType = FeedingType::select('id','name')->get();
            $disposalType = AnimalDisposalType::select('id','name')->get();
            $legalStatus = LegalStatus::select('id','name')->get();
			$sizeUnit = SizeUnit::select('id','name')->get();
            

            $data = [
                'genders' => $genders,
                'idCardType' => $idCardType,
                'livestockTypes' => $livestockTypes,
                'breeds' => $breeds,
                'species' => $species,
                'livestockStages' => $livestockStages,
                'tagTypes' => $tagTypes,
                'livestockMethodObtained'=>$livestockMethodObtained,
                'farmerType'=>$farmerType,
                'regions' => $regions,
                'districts' => $districts,
                'wards' => $wards,
                'educationLevels' => $educationLevels,
                'vaccines'=> $vaccines,
                'diseases'=> $diseases,
                'milkingMethods'=> $milkingMethods,
                'milkingSessions'=> $milkingSessions,
                'milkingUnits'=> $milkingUnits,
                'medicineUnits'=>$medicineUnits,
                'withdrawPeriodUnits'=>$withdrawPeriodUnits,
                'medicines' => $medicine,
                'administrationRoutes'=> $administrationRoutes,
                'feedType'=> $feedType,
                'disposalType'=> $disposalType,
                'legalStatus'=>$legalStatus,
				'sizeUnit'=>$sizeUnit
            ];

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Officer splash data fetched successfully',
                'data' => $data
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
