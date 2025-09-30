<?php

namespace App\Http\Controllers\ExtensionOfficer;

use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerGetSplashFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerLoginFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerOfficerLoginFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerRegistrationFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerRequestOtpFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\ExtensionOfficerVerifyOtpFormAction;
use App\Http\Actions\ExtensionOfficer\Authentication\SaveExtensionOfficerRegistrationFormAction;
use App\Http\Actions\ExtensionOfficer\Dashboard\ExtensionOfficerGetDashboardFormAction;
use App\Http\Actions\ExtensionOfficer\ExtensionOfficerVerifyTagFormAction;
use App\Http\Actions\ExtensionOfficer\Farmer\ExtensionOfficerGetFarmerFormAction;
use App\Http\Actions\ExtensionOfficer\Farmer\ExtensionOfficerGetFarmerListFormAction;
use App\Http\Actions\ExtensionOfficer\Farmer\ExtensionOfficerRegisterFarmerFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerGetFarmProfileFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerGetInvitedFarmProfileFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerGetInvitedFarmsFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerGetLivestockFormAction;
use App\Http\Actions\ExtensionOfficer\Vaccination\ExtensionOfficerGetVaccineBatchesFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerRegisterFarmFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerRegisterLivestockFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerSyncFarmLocationFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\ExtensionOfficerUpdateLiveStockFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\GetVaccinationLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveCalvingLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveDewormingLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveDisposalLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveDryingOffLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveFeedingLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveInseminationLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveLogVaccinationFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveMedicationLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SavePregnancyLogFormAction;
use App\Http\Actions\ExtensionOfficer\Farm\SaveWeightLogFormAction;
use App\Http\Controllers\Controller;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerGetSplashFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerLoginFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerOfficerLoginFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerRegistrationFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerRequestOtpFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerVerifyOtpFormRequest;
use App\Http\Requests\ExtensionOfficer\Authentication\ExtensionOfficerVerifyTagFormRequest;
use App\Http\Requests\ExtensionOfficer\Dashboard\ExtensionOfficerGetDashboardFormRequest;
use App\Http\Requests\ExtensionOfficer\Farmer\ExtensionOfficerGetFarmerFormRequest;
use App\Http\Requests\ExtensionOfficer\Farmer\ExtensionOfficerGetFarmerListFormRequest;
use App\Http\Requests\ExtensionOfficer\Farmer\ExtensionOfficerRegisterFarmerFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerGetFarmProfileFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerGetInvitedFarmProfileFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerGetInvitedFarmsFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerGetLivestokFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerRegisterFarmFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerRegisterLivestockFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerSyncFarmLocationFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\ExtensionOfficerUpdateLiveStockFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\GetVaccinationLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveCalvingLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveDewormingLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveDisposalLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveDryingOffLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveFeedingLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveInseminationLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveLogVaccinationFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveMedicationLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SavePregnancyLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Farm\SaveWeightLogFormRequest;
use App\Http\Requests\ExtensionOfficer\Vaccination\ExtensionOfficerGetVaccineBatchesFormRequest;

class ExtensionOfficerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'getSplash', 'register', 'registerOfficer', 'requestOtp', 'verifyOtp', 'officerLogin']]);
    }

    public function login(ExtensionOfficerLoginFormRequest $request, ExtensionOfficerLoginFormAction $extensionOfficerLoginFormAction)
    {
        $login = $extensionOfficerLoginFormAction->handle($request);
        return response()->json([
            'status' => $login['status'],
            'code' => $login['code'],
            'message' => $login['message'],
            'data' => $login['data'],
        ]);
    }

    public function getSplash(ExtensionOfficerGetSplashFormRequest $request, ExtensionOfficerGetSplashFormAction $extensionOfficerGetSplashFormAction)
    {
        $splash = $extensionOfficerGetSplashFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data'],
        ]);
    }

    public function verifyTag(ExtensionOfficerVerifyTagFormRequest $request, ExtensionOfficerVerifyTagFormAction $extensionOfficerVerifyTagFormAction)
    {
        $verifyTag = $extensionOfficerVerifyTagFormAction->handle($request);
        return response()->json([
            'status' => $verifyTag['status'],
            'code' => $verifyTag['code'],
            'message' => $verifyTag['message'],
            'data' => $verifyTag['data'],
        ]);
    }

    public function registerLivestock(ExtensionOfficerRegisterLivestockFormRequest $request, ExtensionOfficerRegisterLivestockFormAction $extensionOfficerRegisterLivestockFormAction)
    {
        $registerLivestock = $extensionOfficerRegisterLivestockFormAction->handle($request);
        return response()->json([
            'status' => $registerLivestock['status'],
            'code' => $registerLivestock['code'],
            'message' => $registerLivestock['message'],
            'data' => $registerLivestock['data'],
        ]);
    }

    public function getLivestock(ExtensionOfficerGetLivestokFormRequest $request, ExtensionOfficerGetLivestockFormAction $extensionOfficerGetLivestockFormAction)
    {
        $getLivestock = $extensionOfficerGetLivestockFormAction->handle($request);
        return response()->json([
            'status' => $getLivestock['status'],
            'code' => $getLivestock['code'],
            'message' => $getLivestock['message'],
            'data' => $getLivestock['data'],
        ]);
    }

    public function updateLivestock(ExtensionOfficerUpdateLiveStockFormRequest $request, ExtensionOfficerUpdateLiveStockFormAction $extensionOfficerUpdateLiveStockFormAction)
    {
        $updateLivestock = $extensionOfficerUpdateLiveStockFormAction->handle($request);
        return response()->json([
            'status' => $updateLivestock['status'],
            'code' => $updateLivestock['code'],
            'message' => $updateLivestock['message'],
            'data' => $updateLivestock['data'],
        ]);

    }
    public function sycnLocation(ExtensionOfficerSyncFarmLocationFormRequest $request, ExtensionOfficerSyncFarmLocationFormAction $extensionOfficerSyncFarmLocationFormAction)
    {
        $syncLocation = $extensionOfficerSyncFarmLocationFormAction->handle($request);
        return response()->json([
            'status' => $syncLocation['status'],
            'code' => $syncLocation['code'],
            'message' => $syncLocation['message'],
            'data' => $syncLocation['data'],
        ]);
    }

    public function getDashboard(ExtensionOfficerGetDashboardFormRequest $request, ExtensionOfficerGetDashboardFormAction $extensionOfficerGetDashboardFormAction)
    {
        $splash = $extensionOfficerGetDashboardFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data'],
        ]);
    }

    public function register(ExtensionOfficerRegistrationFormRequest $request, SaveExtensionOfficerRegistrationFormAction $saveExtensionOfficerRegistrationFormAction)
    {
        $splash = $saveExtensionOfficerRegistrationFormAction->handle($request);
        return response()->json([
            'status' => $splash['status'],
            'code' => $splash['code'],
            'message' => $splash['message'],
            'data' => $splash['data'],
        ]);

    }

    public function logVaccination(SaveLogVaccinationFormRequest $request,
        SaveLogVaccinationFormAction $saveLogVaccinationFormAction) {
        $logvaccination = $saveLogVaccinationFormAction->handle($request);
        return response()->json([
            'status' => $logvaccination['status'],
            'code' => $logvaccination['code'],
            'message' => $logvaccination['message'],
            'data' => $logvaccination['data'],
        ]);
    }

    public function getVaccinationLog(GetVaccinationLogFormRequest $request,
        GetVaccinationLogFormAction $getVaccinationLogFormAction) {
        $getLog = $getVaccinationLogFormAction->handle($request);
        return response()->json([
            'status' => $getLog['status'],
            'code' => $getLog['code'],
            'message' => $getLog['message'],
            'data' => $getLog['data'],
        ]);
    }

    public function logMedication(SaveMedicationLogFormRequest $request, SaveMedicationLogFormAction $saveMedicationLogFormAction)
    {
        $logMedication = $saveMedicationLogFormAction->handle($request);
        return response()->json([
            'code' => $logMedication['code'],
            'message' => $logMedication['message'],
            'data' => $logMedication['data'],
        ]);

    }
    public function logFeeding(SaveFeedingLogFormRequest $request, SaveFeedingLogFormAction $saveFeedingLogFormAction)
    {
        $logFeeding = $saveFeedingLogFormAction->handle($request);
        return response()->json([
            'code' => $logFeeding['code'],
            'message' => $logFeeding['message'],
            'data' => $logFeeding['data'],
        ]);

    }

    public function logPregnancy(SavePregnancyLogFormRequest $request, SavePregnancyLogFormAction $savePregnancyLogFormAction)
    {
        $logPregnancy = $savePregnancyLogFormAction->handle($request);
        return response()->json([
            'code' => $logPregnancy['code'],
            'message' => $logPregnancy['message'],
            'data' => $logPregnancy['data'],
        ]);
    }

    public function logDisposal(SaveDisposalLogFormRequest $request, SaveDisposalLogFormAction $saveDisposalLogFormAction)
    {
        $logDisposal = $saveDisposalLogFormAction->handle($request);
        return response()->json([
            'code' => $logDisposal['code'],
            'message' => $logDisposal['message'],
            'data' => $logDisposal['data'],
        ]);
    }

    public function logDryingOff(SaveDryingOffLogFormRequest $request, SaveDryingOffLogFormAction $saveDryingOffLogFormAction)
    {
        $logDrying = $saveDryingOffLogFormAction->handle($request);
        return response()->json([
            'code' => $logDrying['code'],
            'message' => $logDrying['message'],
            'data' => $logDrying['data'],
        ]);

    }

    public function logWeight(SaveWeightLogFormRequest $request, SaveWeightLogFormAction $saveWeightLogFormAction)
    {
        $logWeight = $saveWeightLogFormAction->handle($request);
        return response()->json([
            'code' => $logWeight['code'],
            'message' => $logWeight['message'],
            'data' => $logWeight['data'],
        ]);
    }
    public function logDeworming(SaveDewormingLogFormRequest $request, SaveDewormingLogFormAction $saveDewormingLogFormAction)
    {
        $logDeworming = $saveDewormingLogFormAction->handle($request);
        return response()->json([
            'code' => $logDeworming['code'],
            'message' => $logDeworming['message'],
            'data' => $logDeworming['data'],
        ]);
    }

    public function logCalving(SaveCalvingLogFormRequest $request, SaveCalvingLogFormAction $saveCalvingLogFormAction)
    {
        $logCalving = $saveCalvingLogFormAction->handle($request);
        return response()->json([
            'code' => $logCalving['code'],
            'message' => $logCalving['message'],
            'data' => $logCalving['data'],
        ]);
    }
    public function logInsemination(SaveInseminationLogFormRequest $request,
        SaveInseminationLogFormAction $saveInseminationLogFormAction) {
        $logInseminationLog = $saveInseminationLogFormAction->handle($request);
        return response()->json([
            'code' => $logInseminationLog['code'],
            'message' => $logInseminationLog['message'],
            'data' => $logInseminationLog['data'],
        ]);
    }

    //Officer App API
    public function registerOfficer(ExtensionOfficerRegistrationFormRequest $request,
        ExtensionOfficerRegistrationFormAction $extensionOfficerRegistrationFormAction) {
        $registerOfficer = $extensionOfficerRegistrationFormAction->handle($request);

        return response()->json([
            'code' => $registerOfficer['code'],
            'message' => $registerOfficer['message'],
            'data' => $registerOfficer['data'],
        ]);

    }
    public function requestOtp(ExtensionOfficerRequestOtpFormRequest $request, ExtensionOfficerRequestOtpFormAction $extensionOfficerRequestOtpFormAction)
    {
        $requestOtp = $extensionOfficerRequestOtpFormAction->handle($request);
        return response()->json([
            'code' => $requestOtp['code'],
            'message' => $requestOtp['message'],
            'data' => $requestOtp['data'],
        ]);

    }
    public function verifyOtp(ExtensionOfficerVerifyOtpFormRequest $request, ExtensionOfficerVerifyOtpFormAction $extensionOfficerVerifyOtpFormAction)
    {
        $verifyOtp = $extensionOfficerVerifyOtpFormAction->handle($request);
        return response()->json([
            'code' => $verifyOtp['code'],
            'message' => $verifyOtp['message'],
            'data' => $verifyOtp['data'],
        ]);
    }
    public function officerLogin(ExtensionOfficerOfficerLoginFormRequest $request, ExtensionOfficerOfficerLoginFormAction $extensionOfficerOfficerLoginFormAction)
    {
        $officerLogin = $extensionOfficerOfficerLoginFormAction->handle($request);
        return response()->json([
            'code' => $officerLogin['code'],
            'message' => $officerLogin['message'],
            'data' => $officerLogin['data'],
        ]);
    }

    public function registerFarmer(ExtensionOfficerRegisterFarmerFormRequest $request,
        ExtensionOfficerRegisterFarmerFormAction $extensionOfficerRegisterFarmerFormAction) {
        $registerFarmer = $extensionOfficerRegisterFarmerFormAction->handle($request);
        return response()->json([
            'code' => $registerFarmer['code'],
            'message' => $registerFarmer['message'],
            'data' => $registerFarmer['data'],
        ]);

    }
    public function getFarmerList(ExtensionOfficerGetFarmerListFormRequest $request,
        ExtensionOfficerGetFarmerListFormAction $extensionOfficerGetFarmerListFormAction) {
        $getFarmerList = $extensionOfficerGetFarmerListFormAction->handle($request);
        return response()->json([
            'code' => $getFarmerList['code'],
            'message' => $getFarmerList['message'],
            'data' => $getFarmerList['data'],
        ]);

    }
    public function getFarmers(ExtensionOfficerGetFarmerFormRequest $request,
        ExtensionOfficerGetFarmerFormAction $extensionOfficerGetFarmerFormAction) {
        $getFarmer = $extensionOfficerGetFarmerFormAction->handle($request);
        return response()->json([
            'code' => $getFarmer['code'],
            'message' => $getFarmer['message'],
            'data' => $getFarmer['data'],

        ]);

    }
    public function registerFarm(ExtensionOfficerRegisterFarmFormRequest $request,
        ExtensionOfficerRegisterFarmFormAction $extensionOfficerRegisterFarmFormAction) {
        $registerFarm = $extensionOfficerRegisterFarmFormAction->handle($request);
        return response()->json([
            'code' => $registerFarm['code'],
            'message' => $registerFarm['message'],
            'data' => $registerFarm['data'],
        ]);
    }
    public function getInvitedFarms(ExtensionOfficerGetInvitedFarmsFormRequest $request,
        ExtensionOfficerGetInvitedFarmsFormAction $extensionOfficerGetInvitedFarmsFormAction) {
        $getInvitedFarms = $extensionOfficerGetInvitedFarmsFormAction->handle($request);
        return response()->json(
            [
                'code' => $getInvitedFarms['code'],
                'message' => $getInvitedFarms['message'],
                'data' => $getInvitedFarms['data'],
            ]);
    }
    public function getFarmProfile(ExtensionOfficerGetFarmProfileFormRequest $request,
        ExtensionOfficerGetFarmProfileFormAction $extensionOfficerGetFarmProfileFormAction) {
        $getFarmProfile = $extensionOfficerGetFarmProfileFormAction->handle($request);
        return response()->json([
            'code' => $getFarmProfile['code'],
            'message' => $getFarmProfile['message'],
            'data' => $getFarmProfile['data'],
        ]);

    }
    public function getInvitedFarmProfile(ExtensionOfficerGetInvitedFarmProfileFormRequest $request,
        ExtensionOfficerGetInvitedFarmProfileFormAction $extensionOfficerGetInvitedFarmProfileFormAction) {
        $getInvitedFarmProfile = $extensionOfficerGetInvitedFarmProfileFormAction->handle($request);
        return response()->json([
            'code' => $getInvitedFarmProfile['code'],
            'message' => $getInvitedFarmProfile['message'],
            'data' => $getInvitedFarmProfile['data'],
        ]);
    }

    public function getVaccineBatches(ExtensionOfficerGetVaccineBatchesFormRequest $request,
        ExtensionOfficerGetVaccineBatchesFormAction $extensionOfficerGetVaccineBatchesFormAction) {
        $getVaccineBatches = $extensionOfficerGetVaccineBatchesFormAction->handle($request);
        return response()->json(
            [
                'code' => $getVaccineBatches['code'],
                'message' => $getVaccineBatches['message'],
                'data' => $getVaccineBatches['data'],
            ]
        );

    }
}
