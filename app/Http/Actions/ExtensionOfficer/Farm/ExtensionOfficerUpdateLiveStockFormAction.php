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

class ExtensionOfficerUpdateLiveStockFormAction{

    public function handle(Request $request){
        DB::beginTransaction();

        $officer = ExtensionOfficer::find($request->officer_id);
        $user = User::where(['username' => $officer->email, 'profile' => 'ExtensionOfficer'])->first();
        //check if livestock exists
        $getLivestok = Livestock::where(['identification_number' => $request->nida])->first();
        if (!$getLivestok) {
            DB::rollBack();
            return ['status' => false, 'code' => 100,  'message' => 'Livestock You want to update details does not exists.', 'data' => []];
        }
      
        //Update Livestock Details
       if($getLivestok){
             $getLivestok->name = $request->name;
             $getLivestok->livestock_type_id = $request->livestock_type;
             $getLivestok->date_of_birth = $request->dob;
             $getLivestok->gender_id= $request->gender;
             $getLivestok->breed_id= $request->breed;
             $getLivestok->species_id= $request->specie;
             $getLivestok->updated_by = $user->id;
             $getLivestok->updated_at=Carbon::now('Africa/Dar_es_Salaam');
             $getLivestok->save();
       }
      DB::commit();
      return ['status' => true,'code'=>200, 'message' => 'Livestock Details Updated successfully.', 'data' => $getLivestok];
    }

}