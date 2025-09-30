<?php

namespace App\Api\v1\System\Farmer\Actions\FarmProfile;

use App\Api\v1\Core\Auth\Helpers\GetUserProfile;
use App\Models\Farm;
use App\Models\FarmLivestock;
use Illuminate\Support\Facades\DB;

class FarmProfileAction
{
    public static function handle($request)
    {
        //Get farm details
        $farm = Farm::join('farm_owners', 'farms.id', '=', 'farm_owners.farm_id')
            ->join('farmers', 'farm_owners.farmer_id', '=', 'farmers.id')
            ->join('size_units', 'farms.size_unit_id', '=', 'size_units.id')

            ->select('farms.reference_no as registrationNo', 'farms.name as name',
                DB::raw("CONCAT(farmers.first_name, ' ', farmers.surname) AS primaryOwner"),
                'farms.created_at as dateRegistered', 'farms.created_by as createdBy',
                'farms.size as size', 'size_units.short_code as units', 'farmers.id as farmerId'
            )
            ->where(['farm_owners.farmer_id' => $request->farmerId, 'farms.id' => $request->farmId,])
            ->first();

        if (!$farm) {
            return [
                'status' => false,
                'code' => 404,
                'message' => 'Failed!, No Record Found For the Specified Farm',
                'data' => []
            ];
        }

        //Get farm livestocks
        $getLivestock = FarmLivestock::leftJoin('livestocks', 'farm_livestocks.livestock_id', '=', 'livestocks.id')
            ->leftJoin('livestock_types', 'livestocks.livestock_type_id', '=', 'livestock_types.id')
            ->leftJoin('breeds', 'livestocks.breed_id', '=', 'breeds.id')
            ->leftJoin('livestock_stages', function($join) {
                $join->on('livestocks.id', '=', 'livestock_stages.livestock_id')
                     ->whereNull('livestock_stages.end_date'); // Get current stage (no end date)
            })
            ->leftJoin('stages', 'livestock_stages.stage_id', '=', 'stages.id')
            ->leftJoin('livestock_tags','livestocks.id','=','livestock_tags.livestock_id')
            ->select(
                'livestocks.id as cattleId',
                'livestocks.date_of_birth',
                'livestocks.gender_id',
                'livestocks.name as name',
                'breeds.name as breedType',
                'livestocks.created_at as dateRegistered',
                'livestocks.identification_number as identificationNumber',
                'livestocks.weight_as_on_registration as weight',
                'livestocks.breed_id as breed_id',
                'stages.id as stage_id',
                'stages.name as stage_name',
                'livestock_types.id as type_id',
                'livestock_types.name as type_name',
                'livestocks.date_first_entered_to_farm as date_first_entered_to_farm'
            )
            ->where('farm_livestocks.farm_id', $request->farmId)
            ->get();

        $creator = GetUserProfile::init($farm->createdBy);

        $data = [
            "registrationNo" => $farm->registrationNo,
            "name" => $farm->name,
            "primaryOwner" => $farm->primaryOwner,
            "dateRegistered" => $farm->dateRegistered,
            "createdBy" => $creator->name,
            "totalLivestocks" => count($getLivestock),
            "size" => $farm->size,
            "units" => $farm->units,
            "farmProfileUrl" => '',
            'cattles' => $getLivestock,
        ];
        return ['status' => true, 'code' => 200, 'message' => 'Farms Profile Fetched successfully', 'data' => $data];

    }
}
