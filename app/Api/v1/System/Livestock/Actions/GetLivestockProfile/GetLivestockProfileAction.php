<?php

namespace App\Api\v1\System\Livestock\Actions\GetLivestockProfile;

use App\Models\Breed;
use App\Models\Livestock;
use App\Models\LivestockObtainedMethod;
use App\Models\LivestockStatus;
use App\Models\LivestockTag;
use App\Models\Stage;
use App\Models\Vaccination;
use App\Models\WeightUnit;
use Illuminate\Http\Request;

class GetLivestockProfileAction
{
    public static function handle(Request $request){
        $getLivestockDetails = Livestock::where('id',$request->livestockId)->first();

        $tagNumber=LivestockTag::leftJoin('tags','livestock_tags.tag_id','=','tags.id')->select('tags.tag_number')
            ->where('livestock_id',$getLivestockDetails->id)->value('tag_number');
        $motherTag=LivestockTag::leftJoin('tags','livestock_tags.tag_id','=','tags.id')->select('tags.tag_number')
            ->where('livestock_id',$getLivestockDetails->mother_id)->value('tag_number');
        $fatherTag=LivestockTag::leftJoin('tags','livestock_tags.tag_id','=','tags.id')->select('tags.tag_number')
            ->where('livestock_id',$getLivestockDetails->father_id)->value('tag_number');

        //livestock breed
        $livestockBreed = Breed::where('id',$getLivestockDetails->breed_id)->value('name');
        //livestock specie
        $livestockSpecie = Breed::where('id',$getLivestockDetails->species_id)->value('name');
        //livestock gender
        $livestockGender = Breed::where('id',$getLivestockDetails->gender_id)->value('name');

        //obtained method
        $obtainedmethod = LivestockObtainedMethod::where('id',$getLivestockDetails->livestock_obtained_method_id)->value('name');
        //LivestockStatus
        $LivestockStatus = LivestockStatus::where('id',$getLivestockDetails->livestock_status_id)->value('name');

        //livestockStage
        $livestockStage = Stage::join('livestock_stages',
            'stages.id','=','livestock_stages.stage_id')->select('stages.name','stages.id')->where('livestock_stages.livestock_id',$getLivestockDetails->id)->first();

        //Vaccination
        $vaccinationDetails = Vaccination::leftJoin('vaccines','vaccinations.vaccine_id','=','vaccines.id')
            ->leftJoin('vaccination_doses','vaccinations.id','=','vaccination_doses.vaccination_id')
            ->leftJoin('diseases','vaccinations.disease_id','=','diseases.id')
            ->select('vaccines.name as vaccine_name','vaccination_doses.batch_number as vaccinationBatch',
                'diseases.name as targetDisease','vaccination_doses.vaccination_date as dateVaccinated')
            ->where('livestock_id',$getLivestockDetails->id)->get();

        $data = [
            "cattleId"=>$getLivestockDetails->id,
            "nationalIdentificationNo"=>$getLivestockDetails->identification_number,
            "name"=> $getLivestockDetails->name,
            "breed"=>$livestockBreed,
            "breedId"=>$getLivestockDetails->breed_id,
            "gender"=>$livestockGender,
            "genderId"=>$getLivestockDetails->gender_id,
            "specie"=>$livestockSpecie,
            "specieId"=>$getLivestockDetails->specie_id,
            "tagNumber"=> $tagNumber,
            "birthDate"=>$getLivestockDetails->date_of_birth,
            "weight"=>$getLivestockDetails->weight_as_on_registration,
            "weightUnit"=> "KG",
            "weightUnitId"=> WeightUnit::KILOGRAMS,
            "source"=>$obtainedmethod,
            "livestockObtainedMethodId"=>$getLivestockDetails->livestock_obtained_method_id,
            "status"=>$LivestockStatus,
            "stage"=>$livestockStage->name,
            "stageId"=>$livestockStage->id,
            "motherTag"=>$motherTag,
            "fatherTag"=>$fatherTag,
            "vaccinationHistory"=>$vaccinationDetails,
        ];


        return ['status' => true, 'code' => 200,  'message' => 'Livestock Details Fetched successfully', 'data' => $data];

    }

}
