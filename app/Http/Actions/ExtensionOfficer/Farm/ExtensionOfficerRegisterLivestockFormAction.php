<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\Farm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Livestock;
use Illuminate\Support\Carbon;
use App\Models\FarmLivestock;
use App\Models\LivestockStage;
use App\Models\LivestockTag;
use App\Models\Tagging;
use Illuminate\Support\Facades\Storage;
use App\Models\Tag;
use App\Models\Attachment;
use App\Models\ExtensionOfficer;
use App\Models\LivestockAttachment;
use App\Models\ExtensionOfficerFarm;
use App\Models\User;

class ExtensionOfficerRegisterLivestockFormAction
{
    public $user;

    public function handle(Request $request)
    {
        DB::beginTransaction();

        $id = $request->farm_id;

        $this->user = $request->officer_id;

        $officer = ExtensionOfficer::find($request->officer_id);
        $user = User::where(['username' => $officer->email, 'profile' => 'ExtensionOfficer'])->first();

        $farm = Farm::find($id);

        //check if officer assigned to this farm
        $officerFarm = ExtensionOfficerFarm::where(['farm_id' => $farm->id, 'extension_officer_id' => $officer->id, 'state_id' => 1])->get();
        if (count($officerFarm) <= 0) {
            DB::rollBack();
            return ['status' => false, 'code' => 100, 'message' => 'You are not belong to this farm', 'data' => []];
        }

        //check if livestock already exists
        $exists = Livestock::where(['identification_number' => $request->nida])->get();
        if (count($exists) > 0) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Livestock already exists.', 'data' => []];
        }

        //save
        $saveLivestock = $this->saveLivestock($request,$user);
        if (!$saveLivestock['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock', 'data' => []];
        }

        //assign farm
        $assignFarm = $this->saveLivestockFarm($saveLivestock['data'], $farm, $this->user);
        if (!$assignFarm['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100, 'message' => 'Failed to register livestock into farm', 'data' => []];
        }

        //sve stage
        $saveStage = $this->saveLivestockStage($saveLivestock, $request, $this->user);
        if (!$saveStage['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock stage', 'data' => []];
        }

        //save tag
        $saveTag = $this->saveLivestockTag($saveLivestock, $request, $farm, $this->user);
        if (!$saveTag['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to register livestock tag', 'data' => []];
        }

        //save attachment
        $saveAttachment = $this->saveLivestockAttachment($saveLivestock, $request, $this->user);
        if (!$saveAttachment['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to save livestock attachment', 'data' => []];
        }

        DB::commit();
        return ['status' => true, 'code' => 200,  'message' => 'Livestock registered successfully', 'data' => $saveLivestock['data']];
    }

    private function saveLivestock($request,$user)
    {
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
            'created_by' => $user->id,
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
        if($request->livestock_stage != 3){
            $data['livestock_obtained_method_id']=$request->livestock_obtained_method; 
            $data['date_first_entered_to_farm']=$request->date_first_entered_to_farm;
        }elseif($request->livestock_stage == 3){
            $data['livestock_obtained_method_id']=2; 
            $data['date_first_entered_to_farm']=$request->dob;
        }

        //Check if is female livestock
        if($request->gender == 2 && $request->livestock_status !=9){
            $data['livestock_status_id'] =$request->livestock_status;
            $data['parity_lactacting_number']=$request->parity_lactacting_number;
            $data['date_of_last_calving']=$request->date_of_last_calving;
            $data['total_milk_produced']=$request->total_milk_produced;

        }elseif($request->gender == 1){
            $data['livestock_status_id'] = 9;
        }
        $saveLivestock = Livestock::create($data);
        if (!$saveLivestock) {
            return ['status' => false, 'message' => 'Failed to register livestock'];
        }

        return ['status' => true, 'message' => 'Livestock Registered successfully.', 'data' => $saveLivestock];
    }

    private function saveLivestockFarm($livestock, $farm, $user)
    {
        //save livestock farm
        $saveLivestockFarm = FarmLivestock::create([
            'farm_id' => $farm->id,
            'livestock_id' => $livestock->id,
            'state_id' => 1,
            'created_at' => Carbon::now(),
            'created_by' => $user
        ]);

        if (!$saveLivestockFarm) {
            return ['status' => false, 'message' => 'Failed to register livestock into farm'];
        }

        return ['status' => true, 'message' => 'Livestock registered successfully'];
    }

    private function saveLivestockStage($livestock, $request, $user)
    {
        //save livestock stage
        $saveStage = LivestockStage::create([
            'livestock_id' => $livestock['data']['id'],
            'stage_id' => $request->livestock_stage,
            'start_date' => Carbon::now(),
            'created_by' => $user,
            'state_id' => 1,
            'created_at' => Carbon::now()
        ]);
        if (!$saveStage) {
            return ['status' => false, 'message' => 'Failed to register livestock stage'];
        }
        return ['status' => true, 'message' => 'Livestock stage saved'];
    }

    private function saveLivestockTag($livestock, $request, $farm, $user)
    {
        $saveTag = LivestockTag::create([
            'tag_id' => $request->farm_tag,
            'livestock_id' => $livestock['data']['id'],
            'created_by' => $user,
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
            'tagging_status_id' => 1,
            'farm_id' => $farm->id,
            'created_by' => $user
        ]);

        if (!$saveTagging) {
            return ['status' => false, 'message' => 'Failed to register livestock tag'];
        }

        //update tag sattus
        $tag = Tag::find($request->farm_tag);

        $update = $tag->update(['tag_status_id' => 5, 'updated_at' => Carbon::now()]);
        if (!$update) {
            return ['status' => false, 'message' => 'Failed to update livestock tag status'];
        }

        return ['status' => true, 'message' => 'Tag saves suucessfully'];
    }

    private function saveLivestockAttachment($livestock, $request, $user)
    {
        $files = $request->animal_picture;
        $attachment_types = [1];

        if (!is_null($files)) {
            $fileName = hrtime()[1] . '.' . $request->animal_picture->extension();
            $fileSize = $request->animal_picture->getSize();

            $filePath = 'uploads/' . $fileName;

            $path = Storage::disk('attachments')->put($filePath, file_get_contents($request->animal_picture));
            $path = Storage::url($fileName);

            $saveAttachment = Attachment::create([
                'name' => $fileName,
                'path' => $path,
                'size' => $fileSize,
                'attachment_type_id' => $attachment_types[0],
                'created_at' =>  Carbon::now(),
                'created_by' => $user
            ]);
            if (!$saveAttachment) {
                return ['status' => false, 'message' => 'Failed to create animal attachment.'];
            }

            //save livestock attachment
            $saveLivestockAttachment = LivestockAttachment::create([
                'livestock_id' => $livestock['data']['id'],
                'attachment_id' => $saveAttachment->id,
                // 'attachment_id' => $saveAttachment->id,
                'state_id' => 1,
                'created_by' => $user
            ]);
            if (!$saveLivestockAttachment) {
                return ['status' => false, 'message' => 'Failed to save animal attachment.'];
            }
        }

        return ['status' => true, 'message' => 'Animal attachment uploaded successfully.'];
    }
}
