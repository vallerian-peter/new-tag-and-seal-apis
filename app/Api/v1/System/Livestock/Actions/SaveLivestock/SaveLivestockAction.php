<?php

namespace App\Api\v1\System\Livestock\Actions\SaveLivestock;

use App\Api\v1\_Src\Helpers;
use App\Models\AttachmentType;
use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Gender;
use App\Models\Livestock;
use App\Models\LivestockAttachment;
use App\Models\LivestockObtainedMethod;
use App\Models\LivestockStage;
use App\Models\LivestockTag;
use App\Models\Tag;
use App\Models\Tagging;
use App\Models\TaggingStatus;
use App\Models\TagStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class SaveLivestockAction
{



    public static function handle(Request $request)
    {
        DB::beginTransaction();

        $id = $request->farm_id;

        $userId = $request->user()->id;

        $farm = Farm::find($id);

        //check if livestock already exists
        $exists = Livestock::where(['identification_number' => $request->nida])->get();
        if (count($exists) > 0) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Livestock already exists.', 'data' => []];
        }

        //save
        $saveLivestock = self::saveLivestock($request,$userId);
        if (!$saveLivestock['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock', 'data' => []];
        }

        //assign farm
        $assignFarm = self::saveLivestockFarm($saveLivestock['data'], $farm, $request->user());
        if (!$assignFarm['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100, 'message' => 'Failed to register livestock into farm', 'data' => []];
        }

        //sve stage
        $saveStage = self::saveLivestockStage($saveLivestock, $request);
        if (!$saveStage['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock stage', 'data' => []];
        }

        //save tag
        $saveTag = self::saveLivestockTag($saveLivestock, $request, $farm);
        if (!$saveTag['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock tag', 'data' => []];
        }

        //save attachment
        $saveAttachment = self::saveLivestockAttachment($saveLivestock, $request);
        if (!$saveAttachment['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to save livestock attachment', 'data' => []];
        }

        DB::commit();
        return ['status' => true, 'code' => 200,  'message' => 'Livestock registered successfully', 'data' => $saveLivestock['data']];
    }

    private static function saveLivestock($request)
    {
        // Generate UUID for conflict-free sync
        $uuid = $request->uuid ?? \Illuminate\Support\Str::uuid()->toString();

        //save livestock
        $data = [
            'identification_number' => $request->nida,
            'livestock_type_id' => $request->livestock_type,
            'name' => htmlspecialchars($request->name),
            'date_of_birth' => $request->dob,
            'weight_as_on_registration'=>$request->weight_as_on_registration,
            'gender_id' => $request->gender,
            'breed_id' => $request->breed,
            'species_id' => $request->specie,
            'created_by' => $request->user()->id,
            'uuid' => $uuid,
            'created_at' => Carbon::now()
        ];

        //check if mother
        if (isset($request->mother) && $request->mother != "Select mother") {
            $data['mother_id'] = $request->mother;
        }

        //check if father
        if (isset($request->father) && $request->father != "Select father") {
            $data['father_id'] = $request->father;
        }

        //check stage if is not newborn
        if($request->livestock_stage != LivestockStage::NEWBORN){
            $data['livestock_obtained_method_id']=$request->livestock_obtained_method;
            $data['date_first_entered_to_farm']=$request->date_first_entered_to_farm;
        }elseif($request->livestock_stage == LivestockStage::NEWBORN){
            $data['livestock_obtained_method_id']= LivestockObtainedMethod::BORN_ON_FARM;
            $data['date_first_entered_to_farm']=$request->dob;
        }

        //Check if is female livestock
//        if($request->gender == Gender::FEMALE && $request->livestock_status !=9){
        if($request->gender == Gender::FEMALE){
            $data['parity_lactacting_number']=$request->parity_lactacting_number;
            $data['date_of_last_calving']=$request->date_of_last_calving;
            $data['total_milk_produced']=$request->total_milk_produced;

        }
//        elseif($request->gender == Gender::MALE){
//            $data['livestock_status_id'] = 9;
//        }
        $data['livestock_status_id'] =$request->livestock_status;
        $saveLivestock = Livestock::create($data);
        if (!$saveLivestock) {
            return ['status' => false, 'message' => 'Failed to register livestock'];
        }

        return ['status' => true, 'message' => 'Livestock Registered successfully.', 'data' => $saveLivestock];
    }

    private static function saveLivestockFarm($livestock, $farm, $user)
    {
        //save livestock farm
        $saveLivestockFarm = FarmLivestock::create([
            'farm_id' => $farm->id,
            'livestock_id' => $livestock->id,
            'state_id' => 1,
            'created_at' => Carbon::now(),
            'created_by' => $user->id
        ]);

        if (!$saveLivestockFarm) {
            return ['status' => false, 'message' => 'Failed to register livestock into farm'];
        }

        return ['status' => true, 'message' => 'Livestock registered successfully'];
    }

    private static function saveLivestockStage($livestock, $request)
    {
        //save livestock stage
        $saveStage = LivestockStage::create([
            'livestock_id' => $livestock['data']['id'],
            'stage_id' => $request->livestock_stage,
            'start_date' => Carbon::now(),
            'created_by' => $request->user()->id,
            'state_id' => 1,
            'created_at' => Carbon::now()
        ]);
        if (!$saveStage) {
            return ['status' => false, 'message' => 'Failed to register livestock stage'];
        }
        return ['status' => true, 'message' => 'Livestock stage saved'];
    }

    private static function saveLivestockTag($livestock, $request, $farm)
    {
        $saveTag = LivestockTag::create([
            'tag_id' => $request->farm_tag,
            'livestock_id' => $livestock['data']['id'],
            'created_by' => $request->user()->id,
            'state_id' => 1,
            'created_at' => Carbon::now()
        ]);

        if (!$saveTag) {
            return ['status' => false, 'message' => 'Failed to register livestock tag'];
        }

        //save tagging
        $saveTagging = Tagging::create([
            'reference_no' => 'TGG' . hrtime()[1],
            'livestock_id' => $livestock['data']['id'],
            'tag_id' => $request->farm_tag,
            'tagging_status_id' => TaggingStatus::COMPLETED,
            'farm_id' => $farm->id,
            'created_by' => $request->user()->id,
        ]);

        if (!$saveTagging) {
            return ['status' => false, 'message' => 'Failed to register livestock tag'];
        }

        //update tag sattus
        $tag = Tag::find($request->farm_tag);

        $update = $tag->update(['tag_status_id' => TagStatus::ASSIGNED, 'updated_at' => Carbon::now()]);
        if (!$update) {
            return ['status' => false, 'message' => 'Failed to update livestock tag status'];
        }

        return ['status' => true, 'message' => 'Tag saves suucessfully'];
    }

    public static function saveLivestockAttachment($livestock, $request)
    {
        $files = $request->animal_picture;

        $result = Helpers::saveAttachment($files, AttachmentType::PASSPORT_ATTACHMENT_TYPE);

        if (!$result['status']) {
            return $result;
        }

        foreach ($result['data'] as $saveAttachment) {
            //save livestock attachment
            $saveLivestockAttachment = LivestockAttachment::create([
                'livestock_id' => $livestock['data']['id'],
                'attachment_id' => $saveAttachment->id,
                // 'attachment_id' => $saveAttachment->id,
                'state_id' => 1,
                'created_by' => $request->user()->id,
            ]);
            if (!$saveLivestockAttachment) {
                return ['status' => false, 'message' => 'Failed to save animal attachment.'];
            }
        }

        return ['status' => true, 'message' => 'Animal attachment uploaded successfully.'];
    }
}
