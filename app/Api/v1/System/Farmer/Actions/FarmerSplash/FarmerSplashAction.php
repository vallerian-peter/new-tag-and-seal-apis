<?php

namespace App\Api\v1\System\Farmer\Actions\FarmerSplash;

use App\Models\AdministrationRoute;
use App\Models\AnimalDisposalType;
use App\Models\Breed;
use App\Models\CalfConditionType;
use App\Models\CalfProblemType;
use App\Models\CalfReproductiveProblemType;
use App\Models\CalvingType;
use App\Models\Disease;
use App\Models\District;
use App\Models\EducationLevel;
use App\Models\FarmerType;
use App\Models\FeedingType;
use App\Models\Gender;
use App\Models\IdentityCardType;
use App\Models\LegalStatus;
use App\Models\LivestockObtainedMethod;
use App\Models\LivestockType;
use App\Models\LivestockHeatTypes;
use App\Models\Medicine;
use App\Models\MedicineQuantityUnit;
use App\Models\MilkingMethod;
use App\Models\MilkingSession;
use App\Models\MilkingUnit;
use App\Models\Region;
use App\Models\SizeUnit;
use App\Models\Specie;
use App\Models\Stage;
use App\Models\TagType;
use App\Models\Vaccine;
use App\Models\Ward;
use App\Models\WithdrawPeriodUnit;
use App\Models\PregnancyDiagnosisTestResult;
use App\Models\LivestockInseminationServices;
use App\Models\LivestockInseminationSemenStrawTypes;
use App\Models\VaccineDisease;

class FarmerSplashAction
{
    public static function handle() {
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
            $feedingTypes = FeedingType::select('id','name','color')->get();
            $disposalType = AnimalDisposalType::select('id','name')->get();
            $legalStatus = LegalStatus::select('id','name')->get();
            $sizeUnit = SizeUnit::select('id','name')->get();
            $pregnancyStatuses = PregnancyDiagnosisTestResult::select('id','name')->get();
            $inseminationServices = LivestockInseminationServices::select('id','name')->get();
            $semenStrawTypes = LivestockInseminationSemenStrawTypes::select('id','name')->get();
            $heatTypes = LivestockHeatTypes::select('id','name')->get();
            $reproductiveProblemTypes = CalfReproductiveProblemType::select('id','name')->get();
            $calfConditionTypes = CalfConditionType::select('id','name')->get();
            $calfProblemTypes = CalfProblemType::select('id','name')->get();
            $calvingTypes = CalvingType::select('id','name')->get();
            $vaccineDiseases = VaccineDisease::with(['vaccine', 'disease'])->get();


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
                'feedingTypes'=> $feedingTypes,
                'disposalType'=> $disposalType,
                'legalStatus'=>$legalStatus,
                'sizeUnit'=>$sizeUnit,
                'pregnancyStatuses'=>$pregnancyStatuses,
                'inseminationServices'=>$inseminationServices,
                'semenStrawTypes'=>$semenStrawTypes,
                'heatTypes'=>$heatTypes,
                'reproductiveProblemTypes'=>$reproductiveProblemTypes,
                'calfConditionTypes'=>$calfConditionTypes,
                'calfProblemTypes'=>$calfProblemTypes,
                'calvingTypes'=>$calvingTypes,
                'vaccineDiseases'=>$vaccineDiseases
            ];

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Splash data fetched successfully',
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
