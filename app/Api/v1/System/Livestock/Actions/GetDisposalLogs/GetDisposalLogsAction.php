<?php

namespace App\Api\v1\System\Livestock\Actions\GetDisposalLogs;

use App\Models\FarmLivestock;
use App\Models\AnimalDisposal;

class GetDisposalLogsAction
{
    public static function handle($request){
        // Get disposal logs directly for the farm, with livestock information
        $disposalLogs = AnimalDisposal::where('farm_id', $request->farmId)
            ->join('livestocks', 'livestocks.id', '=', 'animal_disposals.livestock_id')
            ->select(
                'animal_disposals.*',
                'livestocks.identification_number',
                'livestocks.name as livestock_name'
            )
            ->orderBy('animal_disposals.created_at', 'desc')
            ->get();

        // Group by livestock for backward compatibility
        $groupedLogs = [];
        foreach($disposalLogs as $log) {
            $livestockId = $log->livestock_id;

            if (!isset($groupedLogs[$livestockId])) {
                $groupedLogs[$livestockId] = [
                    'id' => $log->livestock_id,
                    'identification_number' => $log->identification_number,
                    'name' => $log->livestock_name,
                    'logs' => []
                ];
            }

            $groupedLogs[$livestockId]['logs'][] = $log;
        }

        return ['status' => true, 'code' => 200, 'message' => 'Disposal Log Details Fetched successfully', 'data' => array_values($groupedLogs)];
    }
}
