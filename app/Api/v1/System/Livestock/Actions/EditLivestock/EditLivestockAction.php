<?php

namespace App\Api\v1\System\Livestock\Actions\EditLivestock;

use App\Api\v1\System\Livestock\Actions\SaveLivestock\SaveLivestockAction;
use App\Models\Livestock;
use App\Models\LivestockAttachment;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class EditLivestockAction
{
    public static function handle($request){
        DB::beginTransaction();

        //check if livestock exists
        $getLivestok = Livestock::where(['identification_number' => $request->nida])->first();
        if (!$getLivestok) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Livestock You want to update details does not exists.', 'data' => []];
        }

        //Update Livestock Details
        $getLivestok->name = $request->name ?? $getLivestok->name;
        $getLivestok->livestock_type_id = $request->livestock_type ?? $getLivestok->livestock_type_id;
        $getLivestok->date_of_birth = $request->dob ?? $getLivestok->date_of_birth;
        $getLivestok->gender_id = $request->gender ?? $getLivestok->gender_id;
        $getLivestok->breed_id = $request->breed ?? $getLivestok->breed_id;
        $getLivestok->species_id = $request->specie ?? $getLivestok->species_id;
        $getLivestok->mother_id = $request->mother ?? $getLivestok->mother_id;
        $getLivestok->father_id = $request->father ?? $getLivestok->father_id;
        $getLivestok->livestock_obtained_method_id = $request->livestock_obtained_method ?? $getLivestok->livestock_obtained_method_id;
        $getLivestok->date_first_entered_to_farm = $request->date_entered_farm ?? $getLivestok->date_first_entered_to_farm;
        $getLivestok->weight_as_on_registration = $request->weight ?? $getLivestok->weight_as_on_registration;
        $getLivestok->updated_by = $request->user()->id;
        $getLivestok->updated_at = Carbon::now('Africa/Dar_es_Salaam');
        $getLivestok->save();

        //Update image if set
        //save attachment
        $saveAttachment = self::saveLivestockAttachment($getLivestok, $request);
        if (!$saveAttachment['status']) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Failed to save livestock attachment', 'data' => []];
        }
        DB::commit();
        return ['status' => true,'code'=>200, 'message' => 'Livestock Details Updated successfully.', 'data' => $getLivestok];
    }

    public static function saveLivestockAttachment($saveLivestock, $request){
        LivestockAttachment::where(['livestock_id' => $saveLivestock->id])->delete();
        return SaveLivestockAction::saveLivestockAttachment($saveLivestock, $request);
    }

}
