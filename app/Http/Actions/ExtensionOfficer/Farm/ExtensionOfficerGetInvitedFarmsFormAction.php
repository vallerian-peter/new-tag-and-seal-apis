<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use App\Models\Livestock;
use App\Models\LivestockObtainedMethod;
use App\Models\LivestockStatus;
use App\Models\LivestockTag;
use App\Models\Vaccination;
use Illuminate\Http\Request;
use App\Models\Gender;
use App\Models\FarmLivestockType;
use App\Models\Breed;
use App\Models\Specie;
use App\Models\Stage;
use App\Models\Region;
use App\Models\District;
use App\Models\FarmLivestock;
use App\Models\Ward;
use App\Models\TagType;
use App\Models\FarmTag;
use Illuminate\Support\Facades\DB;


class ExtensionOfficerGetInvitedFarmsFormAction
{
    public function handle(Request $request){
        $getOfficerDetails = ExtensionOfficer::where('id',$request->officerId)->first();

        $invitedFarms = ExtensionOfficerFarm::join('farms','extension_officer_farms.farm_id','=','farms.id')
        ->join('farm_owners','farms.id','=','farm_owners.farm_id')
        ->join('farmers','farm_owners.farmer_id','=','farmers.id')
        ->join('farmer_types', 'farmers.farmer_type_id', '=', 'farmer_types.id')
        ->join('farm_statuses', 'farms.farm_status_id', '=', 'farm_statuses.id') 
        ->select('farmers.id as farmerId','farms.id as farmId',
        'farms.reference_no as farmNumber',
        'farms.name as name',
        DB::raw("CONCAT(farmers.first_name, ' ', farmers.surname) AS owner"),
        'farmer_types.name as ownerType',
        'farms.created_at as dateRegistered',
        'farms.physical_address as farmLocation',
        'farm_statuses.name as status')
        ->where('extension_officer_farms.extension_officer_id',$getOfficerDetails->id)->get();


  
       
            return ['status' => true, 'code' => 200,  'message' => 'Invited Farms Fetched successfully', 'data' => $invitedFarms];
        
    }
}