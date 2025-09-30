<?php

namespace App\Http\Actions\ExtensionOfficer\Farm;

use App\Models\ExtensionOfficer;
use App\Models\ExtensionOfficerFarm;
use App\Models\Farm;
use App\Models\Farmer;
use App\Models\FarmLivestock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExtensionOfficerGetInvitedFarmProfileFormAction
{
    public function handle(Request $request)
    {
        $getOfficerDetails = ExtensionOfficer::where('id', $request->officerId)->first();

        if (!$getOfficerDetails) {
            return ['status' => false, 'code' => 100, 'message' => 'Failed!,Record Not Found For a Specified Officer', 'data' => []];
        }
        $farmerDetails = Farmer::where('id', $request->farmerId)->first();
        if (!$farmerDetails) {
            return ['status' => false, 'code' => 100, 'message' => 'Failed!, No Record Found For the Specified Farmer', 'data' => []];

        }

        $getFarmDetails = ExtensionOfficerFarm::join('extension_officers', 'extension_officer_farms.extension_officer_id', '=', 'extension_officers.id')
        ->join('farms','extension_officer_farms.farm_id','=','farms.id')
            ->join('farm_owners', 'farms.id', '=', 'farm_owners.farm_id')
            ->join('farmers', 'farm_owners.farmer_id', '=', 'farmers.id')
            ->join('size_units', 'farms.size_unit_id', '=', 'size_units.id')

            ->select('farms.id as farmId','farms.reference_no as registrationNo', 'farms.name as name',
                DB::raw("CONCAT(farmers.first_name, ' ', farmers.surname) AS primaryOwner"),
                'farms.created_at as dateRegistred', 'extension_officers.name as createdBy',
                'farms.size as size', 'size_units.short_code
         as units'
            )
            ->where('extension_officer_farms.extension_officer_id', $request->officerId)
            ->get();
        
            $getLivestock = FarmLivestock::leftJoin('livestocks', 'farm_livestocks.livestock_id', '=', 'livestocks.id')
            ->leftJoin('livestock_types', 'livestocks.livestock_type_id', '=', 'livestock_types.id')
            ->leftJoin('breeds', 'livestocks.breed_id', '=', 'breeds.id')
            ->leftJoin('livestock_tags','livestocks.id','=','livestock_tags.livestock_id')
            ->leftJoin('tags','livestock_tags.tag_id','=','tags.id')
            ->select('livestocks.id as cattleId', 'livestocks.name as name', 'breeds.name as breedType', 'livestocks.created_at as dateRegistred', 'tags.tag_number as tagNumber')
            ->where('farm_livestocks.farm_id', $request->farmId)
            ->get();
        foreach ($getFarmDetails as $farm) {
            $data = [
                "registrationNo" => $farm->registrationNo,
                "name" => $farm->name,
                "primaryOwner" => $farm->primaryOwner,
                "dateRegistred" => $farm->dateRegistred,
                "createdBy" => $farm->createdBy,
                "totalLivestocks" => count($getLivestock),
                "size" => $farm->size,
                "units" => $farm->units,
                "farmProfileUrl" => '',
                'cattles' => $getLivestock,
            ];
        }
        return ['status' => true, 'code' => 200, 'message' => 'Invited Farms Profile Fetched successfully', 'data' => $data];

    }
}
