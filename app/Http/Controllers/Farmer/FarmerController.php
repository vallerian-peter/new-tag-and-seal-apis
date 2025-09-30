<?php

namespace App\Http\Controllers\Farmer;

use App\Models\Farmer;
use App\Http\Controllers\Controller;
use App\Http\Actions\Farmer\Farm\GetMilkingLogFormAction;
use App\Http\Actions\Farmer\Farm\SaveMilkingLogFormAction;
use App\Http\Requests\Farmer\Farm\GetMilkingLogFormRequest;
use App\Http\Requests\Farmer\Farm\FarmerLogMilkingFormRequest;
use App\Http\Actions\Farmer\Authentication\FarmerLoginFormAction;
use App\Http\Actions\Farmer\Dashboard\FarmerGetDashboardFormAction;
use App\Http\Requests\Farmer\Authentication\FarmerLoginFormRequest;
use App\Http\Requests\Farmer\Farm\FarmerRegisterNewFarmFormRequest;
use App\Http\Actions\Farmer\Authentication\FarmerGetSplashFormAction;
use App\Http\Actions\Farmer\Farm\SaveFarmerRegisterNewFarmFormAction;
use App\Http\Requests\Farmer\Dashboard\FarmerGetDashboardFormRequest;
use App\Http\Requests\Farmer\Farm\FarmerAssignFarmOfficerFormRequest;
use App\Http\Actions\Farmer\Farm\SaveFarmerAssignFarmOfficerFormAction;
use App\Http\Requests\Farmer\Authentication\FarmerGetSplashFormRequest;
use App\Http\Requests\Farmer\Farm\FarmerRegisterNewFarmUserFormRequest;
use App\Http\Actions\Farmer\Farm\SaveFarmerRegisterNewFarmUserFormAction;
use App\Http\Requests\Farmer\Authentication\FarmerRegistrationFormRequest;
use App\Http\Actions\Farmer\Authentication\SaveFarmerRegistrationFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveLogVaccinationFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\GetVaccinationLogFormAction;
use App\Http\Requests\ExtensionOfficer\Farm\SaveLogVaccinationFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\GetVaccinationLogFormRequest;
use App\Models\Vaccine;
use App\Models\VaccineBatch;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FarmerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register', 'getSplash']]);
    }

    public function login(FarmerLoginFormRequest $request, FarmerLoginFormAction $farmerMobileLoginFormAction)
    {
        $login = $farmerMobileLoginFormAction->handle($request);
        return response()->json([
            'status' => $login['status'],
            'code' => $login['code'],
            'message' => $login['message'],
            'data' => $login['data']
        ]);
    }

    public function getDashboard(FarmerGetDashboardFormRequest $request, FarmerGetDashboardFormAction $farmerGetDashboardFormAction)
    {
        $splash = $farmerGetDashboardFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }

    public function getSplash(FarmerGetSplashFormRequest $request, FarmerGetSplashFormAction $farmerMobileGetSplashFormAction)
    {
        $splash = $farmerMobileGetSplashFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }

    public function register(FarmerRegistrationFormRequest $request, SaveFarmerRegistrationFormAction $saveFarmerRegistrationFormAction)
    {
        $splash = $saveFarmerRegistrationFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }

    public function registerFarm(FarmerRegisterNewFarmFormRequest $request, SaveFarmerRegisterNewFarmFormAction $saveFarmerRegisterNewFarmFormAction)
    {
        $splash = $saveFarmerRegisterNewFarmFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }
    public function logMilking(FarmerLogMilkingFormRequest $request,SaveMilkingLogFormAction $saveMilkingLogFormAction){
        $logmilk = $saveMilkingLogFormAction->handle($request);
        return response()->json([
            'status' => $logmilk['status'],
            'code' => $logmilk['code'],
            'message' => $logmilk['message'],
            'data' => $logmilk['data']
        ]);

    }

    public function getMilkingLog(GetMilkingLogFormRequest $request,GetMilkingLogFormAction $getMilkingLogFormAction){
        $log = $getMilkingLogFormAction->handle($request);
        return response()->json([
            'status'=> $log['status'],
            'code'=> $log['code'],
            'message'=> $log['message'],
            'data'=> $log['data']
            ]);
    }

    public function registerUser(FarmerRegisterNewFarmUserFormRequest $request, SaveFarmerRegisterNewFarmUserFormAction $saveFarmerRegisterNewFarmUserFormAction)
    {
        $splash = $saveFarmerRegisterNewFarmUserFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }

    public function assignFarmOfficer(FarmerAssignFarmOfficerFormRequest $request, SaveFarmerAssignFarmOfficerFormAction $saveFarmerAssignFarmOfficerFormAction)
    {
        $splash = $saveFarmerAssignFarmOfficerFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data']
        ]);
    }

    public function saveVaccinationLog(SaveLogVaccinationFormRequest $request, SaveLogVaccinationFormAction $saveLogVaccinationFormAction)
    {
        $logVaccination = $saveLogVaccinationFormAction->handle($request);
        return response()->json([
            'status' => $logVaccination['status'],
            'code' => $logVaccination['code'],
            'message' => $logVaccination['message'],
            'data' => $logVaccination['data']
        ]);
    }

    public function getVaccinationLogs(GetVaccinationLogFormRequest $request, GetVaccinationLogFormAction $getVaccinationLogFormAction)
    {
        $log = $getVaccinationLogFormAction->handle($request);
        return response()->json([
            'status' => $log['status'],
            'code' => $log['code'],
            'message' => $log['message'],
            'data' => $log['data']
        ]);
    }

    public function saveVaccinationInventory(Request $request)
    {
        try {
            DB::beginTransaction();

            $user = Auth::user();

            // Validate required fields
            $request->validate([
                'name' => 'required|string|max:255',
                'farm_id' => 'required|exists:farms,id',
                'lot' => 'required|string',
                'formulation_type' => 'required|string',
                'dose' => 'required|string',
                'batch_number' => 'required|string',
                'quantity' => 'required|numeric|min:0',
                'expiry_date' => 'required|date',
                'manufacturer' => 'nullable|string',
                'description' => 'nullable|string',
            ]);

            // Create vaccine record
            $vaccine = Vaccine::create([
                'name' => $request->name,
                'farm_id' => $request->farm_id,
                'lot' => $request->lot,
                'formulation_type' => $request->formulation_type,
                'dose' => $request->dose,
                'created_by' => $user->id,
                'vaccine_status_id' => 1, // Active
                'vaccine_type_id' => 1, // Default type
                'vaccine_schedule_id' => 1, // Default schedule
            ]);

            // Create vaccine batch record
            $batch = VaccineBatch::create([
                'vaccine_id' => $vaccine->id,
                'batch_number' => $request->batch_number,
                'quantity' => $request->quantity,
                'expiry_date' => $request->expiry_date,
                'created_by' => $user->id,
            ]);

            DB::commit();

            return response()->json([
                'status' => true,
                'code' => 200,
                'message' => 'Vaccine inventory saved successfully',
                'data' => [
                    'vaccine' => $vaccine,
                    'batch' => $batch
                ]
            ]);

        } catch (\Exception $ex) {
            DB::rollBack();
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getVaccinationInventory(Request $request)
    {
        try {
            $user = Auth::user();

            // Get all vaccines for farms owned by the user
            $vaccines = Vaccine::with(['farm', 'batches', 'status', 'type'])
                ->whereHas('farm', function($query) use ($user) {
                    $query->where('created_by', $user->id);
                })
                ->get();

            // Format the response to include batch information
            $formattedVaccines = $vaccines->map(function($vaccine) {
                return [
                    'id' => $vaccine->id,
                    'name' => $vaccine->name,
                    'farm_id' => $vaccine->farm_id,
                    'farm_name' => $vaccine->farm->name ?? '',
                    'lot' => $vaccine->lot,
                    'formulation_type' => $vaccine->formulation_type,
                    'dose' => $vaccine->dose,
                    'batches' => $vaccine->batches->map(function($batch) {
                        return [
                            'id' => $batch->id,
                            'batch_number' => $batch->batch_number,
                            'quantity' => $batch->quantity,
                            'expiry_date' => $batch->expiry_date,
                        ];
                    }),
                    'created_at' => $vaccine->created_at,
                ];
            });

            return response()->json([
                'status' => true,
                'code' => 200,
                'message' => 'Vaccine inventory retrieved successfully',
                'data' => $formattedVaccines
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveInseminationLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'inseminationServiceId' => 'required|integer',
                'currentHeatTypeId' => 'required|integer',
                'lastHeatDate' => 'required|date',
                'inseminationDate' => 'required|date',
                'bullCode' => 'nullable|string',
                'bullBreed' => 'nullable|string',
                'semenProductionDate' => 'nullable|date',
                'semenBatchNumber' => 'nullable|string',
                'inseminationSemenStrawTypeId' => 'nullable|integer',
                'productionCountry' => 'nullable|string',
                'internationalId' => 'nullable|string',
                'aiCode' => 'nullable|string',
                'manufacturerName' => 'nullable|string',
                'semenSupplier' => 'nullable|string',
            ]);

            // Use the existing SaveInseminationLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveInseminationLog\SaveInseminationLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getInseminationLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Get all livestock for the farm
            $livestock = \App\Models\FarmLivestock::where('farm_id', $request->farmId)
                ->with(['livestock'])
                ->get();

            \Log::info('Insemination Logs Debug', [
                'farm_id' => $request->farmId,
                'livestock_count' => $livestock->count(),
                'livestock_data' => $livestock->map(function($item) {
                    return [
                        'farm_livestock_id' => $item->id,
                        'livestock_id' => $item->livestock_id,
                        'livestock_name' => $item->livestock ? $item->livestock->name : 'No livestock data',
                        'livestock_serial' => $item->livestock ? $item->livestock->identification_number : 'No serial'
                    ];
                })
            ]);

            $result = [];

            foreach ($livestock as $farmLivestock) {
                $livestockData = $farmLivestock->livestock;
                if ($livestockData) {
                    // Get insemination logs for this livestock
                    $logs = \App\Models\LivestockInseminations::where('livestock_id', $livestockData->id)
                        ->with(['inseminationService', 'currentHeatType', 'semenStrawType'])
                        ->get();

                    \Log::info('Insemination Logs for Livestock', [
                        'livestock_id' => $livestockData->id,
                        'livestock_serial' => $livestockData->identification_number,
                        'logs_count' => $logs->count()
                    ]);

                    $formattedLogs = $logs->map(function($log) {
                        return [
                            'id' => $log->id,
                            'reference_no' => $log->reference_no,
                            'livestock_id' => $log->livestock_id,
                            'serial' => $log->serial,
                            'last_heat_date' => $log->last_heat_date,
                            'current_heat_type_id' => $log->current_heat_type_id,
                            'current_heat_type' => $log->currentHeatType ? [
                                'id' => $log->currentHeatType->id,
                                'name' => $log->currentHeatType->name
                            ] : null,
                            'insemination_date' => $log->insemination_date,
                            'insemination_service_id' => $log->insemination_service_id,
                            'insemination_service' => $log->inseminationService ? [
                                'id' => $log->inseminationService->id,
                                'name' => $log->inseminationService->name
                            ] : null,
                            'insemination_semen_straw_type_id' => $log->insemination_semen_straw_type_id,
                            'semen_straw_type' => $log->semenStrawType ? [
                                'id' => $log->semenStrawType->id,
                                'name' => $log->semenStrawType->name
                            ] : null,
                            'bull_code' => $log->bull_code,
                            'bull_breed' => $log->bull_breed,
                            'semen_production_date' => $log->semen_production_date,
                            'production_country' => $log->production_country,
                            'semen_batch_number' => $log->semen_batch_number,
                            'international_id' => $log->international_id,
                            'ai_code' => $log->ai_code,
                            'manufacturer_name' => $log->manufacturer_name,
                            'semen_supplier' => $log->semen_supplier,
                            'created_at' => $log->created_at,
                            'updated_at' => $log->updated_at,
                        ];
                    });

                    $result[] = [
                        'id' => $livestockData->id,
                        'identification_number' => $livestockData->identification_number,
                        'name' => $livestockData->name,
                        'logs' => $formattedLogs
                    ];
                }
            }

            return response()->json([
                'status' => true,
                'code' => 200,
                'message' => 'Insemination logs retrieved successfully',
                'data' => $result
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveFeedingLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'feedTypeId' => 'required|integer',
                'amount' => 'required|numeric',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveFeedingLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveFeedingLog\SaveFeedingLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getFeedingLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetFeedingLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetFeedingLogs\GetFeedingLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function savePregnancyLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'pregnancyStatusId' => 'required|integer',
                'months' => 'required|integer',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SavePregnancyLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SavePregnancyLog\SavePregnancyLogAction::handle($request);

            if ($result['status'] == true) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getPregnancyLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetPregnancyLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetPregnancyLogs\GetPregnancyLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveMedicationLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'medicationId' => 'required|integer',
                'amount' => 'required|numeric',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveMedicationLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveMedicationLog\SaveMedicationLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getMedicationLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetMedicationLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetMedicationLogs\GetMedicationLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveCalvingLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'calvingTypeId' => 'required|integer',
                'calvingProblemsId' => 'required|integer',
                'reproductiveProblemId' => 'required|integer',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveCalvingLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveCalvingLog\SaveCalvingLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getCalvingLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetCalvingLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetCalvingLogs\GetCalvingLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveDewormingLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'dewormingTypeId' => 'required|integer',
                'amount' => 'required|numeric',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveDewormingLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveDewormingLog\SaveDewormingLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getDewormingLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetDewormingLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetDewormingLogs\GetDewormingLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveWeightLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'weight' => 'required|numeric',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveWeightLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveWeightLog\SaveWeightLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getWeightLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetWeightLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetWeightLogs\GetWeightLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveDryingOffLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'startDate' => 'required|date',
                'endDate' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveDryingOffLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveDryingOffLog\SaveDryingOffLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getDryingOffLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetDryingOffLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetDryingOffLogs\GetDryingOffLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function saveDisposalLog(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
                'livestockId' => 'required|integer',
                'disposalTypeId' => 'required|integer',
                'date' => 'required|date',
                'remarks' => 'nullable|string',
            ]);

            // Use the existing SaveDisposalLogAction
            $result = \App\Api\v1\System\Livestock\Actions\SaveDisposalLog\SaveDisposalLogAction::handle($request);

            if ($result['code'] == 200) {
                return response()->json([
                    'status' => true,
                    'code' => 200,
                    'message' => $result['message'],
                    'data' => $result['data']
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'code' => $result['code'],
                    'message' => $result['message'],
                    'data' => []
                ]);
            }

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }

    public function getDisposalLogs(Request $request)
    {
        try {
            $user = Auth::user();

            // Validate the request
            $request->validate([
                'farmId' => 'required|integer',
            ]);

            // Use the existing GetDisposalLogsAction
            $result = \App\Api\v1\System\Livestock\Actions\GetDisposalLogs\GetDisposalLogsAction::handle($request);

            return response()->json([
                'status' => $result['status'],
                'code' => $result['code'],
                'message' => $result['message'],
                'data' => $result['data']
            ]);

        } catch (\Exception $ex) {
            return response()->json([
                'status' => false,
                'code' => 500,
                'message' => $ex->getMessage(),
                'data' => []
            ]);
        }
    }
}
