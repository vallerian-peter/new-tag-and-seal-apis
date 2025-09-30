<?php

namespace App\Http\Actions\ExtensionOfficer\Farmer;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use App\Models\Farmer;
use App\Models\FarmerStatus;
use App\Models\FarmerType;
use App\Models\FarmOwner;
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
use Illuminate\Support\Facades\DB;
use App\Models\Region;
use App\Models\District;
use App\Models\FarmLivestock;
use App\Models\Ward;
use App\Models\TagType;
use App\Models\FarmTag;

class ExtensionOfficerGetFarmerListFormAction
{
    public function handle(Request $request){

        $getFarmerDetails = Farmer::where('created_by',$request->officerId)->get();
        if(!$getFarmerDetails){
            return response()->json([
                'status' => false,
                'code' => 100,
                'message' => 'Failed. No Farmer record for the specified Officer.',
                'data' => [],
            ]);
        }
        $farmerData = [];
        foreach($getFarmerDetails as $farmer){
        $farmerStatus = FarmerStatus::where('id',$farmer->farmer_status_id)->value('name');

        $farmerType = FarmerType::where('id',$farmer->farmer_type_id)->value('name');
        $farms = Farm::join('farm_owners', 'farms.id', '=', 'farm_owners.farm_id')
    ->join('farmers', 'farm_owners.farmer_id', '=', 'farmers.id')
    ->join('farmer_types', 'farmers.farmer_type_id', '=', 'farmer_types.id')
    ->join('farm_statuses', 'farms.farm_status_id', '=', 'farm_statuses.id')
    ->select(
        'farmers.id as farmerId',
        'farms.reference_no as farmNumber',
        'farms.name as name',
        DB::raw("CONCAT(farmers.first_name, ' ', farmers.surname) AS owner"),
        'farmer_types.name as ownerType',
        'farms.created_at as dateRegistered',
        'farms.physical_address as farmLocation',
        'farm_statuses.name as status'
    )
    ->where('farm_owners.farmer_id', $farmer->id)
    ->get();
        $region = Region::where('id',$farmer->region_id)->value('name');
        $district = District::where('id',$farmer->district_id)->value('name');
        $officer = ExtensionOfficer::where('id',$farmer->created_by)->value('name');
    
        $farmerData []= [
            'farmerId'=>$farmer->id,
            "membeshipNumber"=> $farmer->farmer_no,
            "name"=>$farmer->first_name . ' ' . $farmer->surname,
            "status"=>$farmerStatus,
            "type"=>$farmerType,
            "dateRegistered"=>$farmer->created_at,
            "totalFarms"=>count($farms),
            "address"=>$farmer->physical_address,
            "region"=>$region,
            "district"=>$district,
            "createdBy"=> $officer,
            "lastUpdated"=>$farmer->updated_at,
        ];
    
    }

          
            return ['status' => true, 'code' => 200,  'message' => 'Farmer List Fetched successfully', 'data' => $farmerData];
        
    }
}