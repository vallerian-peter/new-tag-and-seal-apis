<?php

namespace App\Http\Actions\ExtensionOfficer\Vaccination;

use App\Models\VaccineOfficerBatch;
use Illuminate\Http\Request;

class ExtensionOfficerGetVaccineBatchesFormAction
{
    public function handle(Request $request)
    {
        $officer = $request->officerId;

        //get officer batches
        $vaccineOfficerBatches = VaccineOfficerBatch::join('vaccine_batches', 'vaccine_officer_batches.vaccine_batch_id', '=', 'vaccine_batches.id')
            ->join('vaccines', 'vaccine_batches.vaccine_id', '=', 'vaccines.id')
            ->select('vaccines.id as vaccine_id', 'vaccines.name as type', 'vaccine_batches.created_at as issuedDate', 'vaccine_batches.id as batch_id', 'vaccine_batches.expiry_date as batch_expiry', 'vaccine_officer_batches.*')
            ->where('vaccine_officer_batches.officer_id', $officer)->get();
        // Group the data by vaccine type
        $groupedData = $vaccineOfficerBatches->groupBy('type')->map(function ($batches, $type) {
            // Get the first batch for issuedDate
            $issuedDate = $batches->first()->issuedDate;

            // Map the batches to format the batch list
            $batchList = $batches->map(function ($batch) {
                return [
                    'id' => $batch->batch_id,
                    'quantity' => $batch->quantity,
                    'expiryDate' => $batch->batch_expiry,
                ];
            })->values();

            // Return the formatted structure
            return [
                'type' => $type,
                'issuedDate' => $issuedDate,
                'batchList' => $batchList,
            ];
        })->values();

        return ['status' => true, 'code' => 200, 'message' => 'Vaccination Log Details Fetched successfully', 'data' => $groupedData];
    }
}
