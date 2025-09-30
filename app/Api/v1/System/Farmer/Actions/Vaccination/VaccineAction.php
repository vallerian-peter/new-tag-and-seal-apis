<?php

namespace App\Api\v1\System\Farmer\Actions\Vaccination;

use Exception;
use Carbon\Carbon;
use App\Models\Farm;
use App\Models\User;
use App\Models\Vaccine;
use App\Models\FarmVaccine;
use Illuminate\Support\Str;
use App\Models\VaccineBatch;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;
use App\Api\v1\System\Farmer\Actions\Vaccination\RegisterVaccineRequest;

class VaccineAction
{
    public static function handle(RegisterVaccineRequest $request)
    {
        // Validate the request data
        $validated = $request->validated();

        try {
            // Start a database transaction
            DB::beginTransaction();

            // Check if the farm exists and belongs to the authenticated user
            $farm = Farm::where('id', $validated['farmId'])
                        ->where('user_id', Auth::id())
                        ->first();

            if (!$farm) {
                return response()->json(['error' => 'Farm not found or access denied.'], 404);
            }

            // Create new record in Vaccine, VaccineBatch, Vaccination
            $vaccine = new Vaccine();
            $vaccine->name = $validated['name'];
            $vaccine->farm_id = $farm->id;
            $vaccine->lot = $validated['lot'];
            $vaccine->formulation_type = $validated['formulationType'];
            $vaccine->dose = $validated['dose'];
            $vaccine->created_by = Auth::id();
            $vaccine->updated_by = Auth::id();
            // Set default status, type, schedule (assuming IDs 1 for simplicity)
            $vaccine->vaccine_status_id = 1; // e.g., 'active'
            $vaccine->vaccine_type_id = 1;   // e.g., 'vaccine type 1'
            $vaccine->vaccine_schedule_id = 1; // e.g., 'schedule 1'
            $vaccine->save();

            // Create Vaccine Batch
            $vaccineBatch = new VaccineBatch();
            $vaccineBatch->vaccine_id = $vaccine->id;
            $vaccineBatch->batch_number = $validated['batchNumber'];
            $vaccineBatch->quantity = $validated['quantity'];
            $vaccineBatch->quantity_uom_id = 1; // assuming '1'
            $vaccineBatch->expiry_date = Carbon::parse($validated['expiryDate']);
            $vaccineBatch->created_by = Auth::id();
            $vaccineBatch->updated_by = Auth::id();
            $vaccineBatch->save();

            // Commit the transaction
            DB::commit();

            return [
                'status' => true,
                'code' => 200,
                'message' => 'Vaccine registered successfully.',
                'data' => $vaccine
            ];
        } catch (Exception $e) {
            // Rollback the transaction in case of error
            DB::rollBack();
            Log::error('Error registering vaccine: ' . $e->getMessage());
            return [
                'status' => false,
                'code' => 100,
                'message' => 'An error occurred while registering the vaccine.',
                'data' => []
            ];
        }
    }
}
