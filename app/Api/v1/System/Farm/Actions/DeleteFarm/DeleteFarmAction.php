<?php

namespace App\Api\v1\System\Farm\Actions\DeleteFarm;

use App\Models\Farm;
use App\Models\FarmLivestock;
use App\Models\Vaccination;
use App\Models\Milking;
use App\Models\Feeding;
use App\Models\Pregnancy;
use App\Models\Calving;
use App\Models\Medication;
use App\Models\Insemination;
use App\Models\Deworming;
use App\Models\Weight;
use App\Models\DryingOff;
use App\Models\Disposal;
use Illuminate\Support\Facades\DB;

class DeleteFarmAction
{
    public static function handle($request)
    {
        DB::beginTransaction();

        try {
            // Check if farm exists
            $farm = Farm::where('id', $request->farm_id)->first();
            if (!$farm) {
                DB::rollBack();
                return [
                    'status' => false,
                    'code' => 404,
                    'message' => 'Farm not found.',
                    'data' => []
                ];
            }

            // Check if user has permission to delete this farm
            // You might want to add authorization logic here

            // Get all livestock associated with this farm
            $farmLivestockIds = FarmLivestock::where('farm_id', $farm->id)
                ->pluck('livestock_id')
                ->toArray();

            // Delete all related logs for livestock in this farm
            if (!empty($farmLivestockIds)) {
                // Delete vaccination logs
                Vaccination::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete milking logs
                Milking::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete feeding logs
                Feeding::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete pregnancy logs
                Pregnancy::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete calving logs
                Calving::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete medication logs
                Medication::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete insemination logs
                Insemination::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete deworming logs
                Deworming::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete weight logs
                Weight::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete drying off logs
                DryingOff::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete disposal logs
                Disposal::whereIn('livestock_id', $farmLivestockIds)->delete();

                // Delete farm-livestock relationships
                FarmLivestock::where('farm_id', $farm->id)->delete();
            }

            // Delete farm-specific logs
            Vaccination::where('farm_id', $farm->id)->delete();
            Milking::where('farm_id', $farm->id)->delete();
            Feeding::where('farm_id', $farm->id)->delete();
            Pregnancy::where('farm_id', $farm->id)->delete();
            Calving::where('farm_id', $farm->id)->delete();
            Medication::where('farm_id', $farm->id)->delete();
            Insemination::where('farm_id', $farm->id)->delete();
            Deworming::where('farm_id', $farm->id)->delete();
            Weight::where('farm_id', $farm->id)->delete();
            DryingOff::where('farm_id', $farm->id)->delete();
            Disposal::where('farm_id', $farm->id)->delete();

            // Finally delete the farm
            $farm->delete();

            DB::commit();

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Farm and all related data deleted successfully.',
                'data' => []
            ];

        } catch (\Exception $e) {
            DB::rollBack();
            return [
                'status' => false,
                'code' => 500,
                'message' => 'Failed to delete farm: ' . $e->getMessage(),
                'data' => []
            ];
        }
    }
}
