<?php

namespace App\Api\v1\System\Livestock\Actions\DeleteLivestock;

use App\Models\Livestock;
use App\Models\LivestockAttachment;
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
use App\Models\LivestockTag;
use Illuminate\Support\Facades\DB;

class DeleteLivestockAction
{
    public static function handle($request)
    {
        DB::beginTransaction();

        try {
            // Check if livestock exists
            $livestock = Livestock::where('identification_number', $request->nida)->first();
            if (!$livestock) {
                DB::rollBack();
                return [
                    'status' => false,
                    'code' => 404,
                    'message' => 'Livestock not found.',
                    'data' => []
                ];
            }

            $livestockId = $livestock->id;

            // Delete all related logs for this livestock
            Vaccination::where('livestock_id', $livestockId)->delete();
            Milking::where('livestock_id', $livestockId)->delete();
            Feeding::where('livestock_id', $livestockId)->delete();
            Pregnancy::where('livestock_id', $livestockId)->delete();
            Calving::where('livestock_id', $livestockId)->delete();
            Medication::where('livestock_id', $livestockId)->delete();
            Insemination::where('livestock_id', $livestockId)->delete();
            Deworming::where('livestock_id', $livestockId)->delete();
            Weight::where('livestock_id', $livestockId)->delete();
            DryingOff::where('livestock_id', $livestockId)->delete();
            Disposal::where('livestock_id', $livestockId)->delete();

            // Delete livestock attachments
            LivestockAttachment::where('livestock_id', $livestockId)->delete();

            // Delete livestock tags
            LivestockTag::where('livestock_id', $livestockId)->delete();

            // Delete farm-livestock relationships
            FarmLivestock::where('livestock_id', $livestockId)->delete();

            // Update parent/child relationships for other livestock
            Livestock::where('mother_id', $livestockId)->update(['mother_id' => null]);
            Livestock::where('father_id', $livestockId)->update(['father_id' => null]);

            // Finally delete the livestock
            $livestock->delete();

            DB::commit();

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Livestock and all related data deleted successfully.',
                'data' => []
            ];

        } catch (\Exception $e) {
            DB::rollBack();
            return [
                'status' => false,
                'code' => 500,
                'message' => 'Failed to delete livestock: ' . $e->getMessage(),
                'data' => []
            ];
        }
    }
}
