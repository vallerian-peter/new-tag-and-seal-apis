<?php
namespace App\Api\v1\System\Farmer;

use App\Http\Controllers\Controller;
use App\Api\v1\Core\Auth\Actions\Login\LoginFormRequest;
use App\Api\v1\System\Farm\Actions\VerifyTag\VerifyTagAction;
use App\Api\v1\System\Farmer\Actions\Login\FarmerLoginAction;
use App\Api\v1\System\Farm\Actions\VerifyTag\VerifyTagRequest;
use App\Api\v1\System\Farmer\Actions\Vaccination\VaccineAction;
use App\Api\v1\System\Farmer\Actions\Vaccination\VaccineRequest;
use App\Api\v1\System\Farmer\Actions\Vaccination\GetVaccineAction;
use App\Api\v1\System\Farmer\Actions\Vaccination\GetVaccineRequest;
use App\Api\v1\System\Farmer\Actions\GetFarms\GetFarmsAction;
use App\Api\v1\System\Farmer\Actions\GetFarms\GetFarmsRequest;
use App\Api\v1\System\Farmer\Actions\CreateFarm\CreateFarmAction;
use App\Api\v1\System\Farmer\Actions\CreateFarm\CreateFarmRequest;
use App\Api\v1\System\Farm\Actions\EditFarm\EditFarmAction;
use App\Api\v1\System\Farm\Actions\EditFarm\EditFarmRequest;
use App\Api\v1\System\Farm\Actions\DeleteFarm\DeleteFarmAction;
use App\Api\v1\System\Farm\Actions\DeleteFarm\DeleteFarmRequest;
use App\Api\v1\System\Farm\Actions\GetUserRoles\GetUserRolesAction;
use App\Api\v1\System\Farmer\Actions\FarmProfile\FarmProfileAction;
use App\Api\v1\System\Farmer\Actions\Register\FarmerRegisterAction;
use App\Api\v1\System\Farm\Actions\GetUserRoles\GetUserRolesRequest;
use App\Api\v1\System\Farmer\Actions\FarmProfile\FarmProfileRequest;
use App\Api\v1\System\Farmer\Actions\Register\FarmerRegisterRequest;
use App\Api\v1\System\Farm\Actions\InviteOfficer\InviteOfficerAction;
use App\Api\v1\System\Farmer\Actions\FarmerSplash\FarmerSplashAction;
use App\Api\v1\System\Farm\Actions\InviteOfficer\InviteOfficerRequest;
use App\Api\v1\System\Livestock\Actions\SaveDisposal\SaveDisposalAction;
use App\Api\v1\System\Livestock\Actions\SaveDisposal\SaveDisposalRequest;
use App\Api\v1\System\Livestock\Actions\EditLivestock\EditLivestockAction;
use App\Api\v1\System\Livestock\Actions\DeleteLivestock\DeleteLivestockAction;
use App\Api\v1\System\Livestock\Actions\GetWeightLogs\GetWeightLogsAction;
use App\Api\v1\System\Livestock\Actions\SaveLivestock\SaveLivestockAction;
use App\Api\v1\System\Livestock\Actions\SaveWeightLog\SaveWeightLogAction;
use App\Api\v1\System\Farm\Actions\RegisterFarmUser\RegisterFarmUserAction;
use App\Api\v1\System\Livestock\Actions\EditLivestock\EditLivestockRequest;
use App\Api\v1\System\Livestock\Actions\DeleteLivestock\DeleteLivestockRequest;
use App\Api\v1\System\Livestock\Actions\GetWeightLogs\GetWeightLogsRequest;
use App\Api\v1\System\Livestock\Actions\SaveLivestock\SaveLivestockRequest;
use App\Api\v1\System\Livestock\Actions\SaveWeightLog\SaveWeightLogRequest;
use App\Api\v1\System\Farm\Actions\RegisterFarmUser\RegisterFarmUserRequest;
use App\Api\v1\System\Farm\Actions\GetFarmUsers\GetFarmUsersAction;
use App\Api\v1\System\Farm\Actions\GetFarmUsers\GetFarmUsersRequest;
use App\Api\v1\System\Farm\Actions\GetExtensionOfficers\GetExtensionOfficersAction;
use App\Api\v1\System\Farm\Actions\GetExtensionOfficers\GetExtensionOfficersRequest;
use App\Api\v1\System\Livestock\Actions\GetCalvingLogs\GetCalvingLogsAction;
use App\Api\v1\System\Livestock\Actions\GetFeedingLogs\GetFeedingLogsAction;
use App\Api\v1\System\Livestock\Actions\GetMilkingLogs\GetMilkingLogsAction;
use App\Api\v1\System\Livestock\Actions\SaveCalvingLog\SaveCalvingLogAction;
use App\Api\v1\System\Livestock\Actions\SaveFeedingLog\SaveFeedingLogAction;
use App\Api\v1\System\Livestock\Actions\SaveMilkingLog\SaveMilkingLogAction;
use App\Api\v1\System\Livestock\Actions\GetCalvingLogs\GetCalvingLogsRequest;
use App\Api\v1\System\Livestock\Actions\GetFeedingLogs\GetFeedingLogsRequest;
use App\Api\v1\System\Livestock\Actions\GetMilkingLogs\GetMilkingLogsRequest;
use App\Api\v1\System\Livestock\Actions\SaveCalvingLog\SaveCalvingLogRequest;
use App\Api\v1\System\Livestock\Actions\SaveFeedingLog\SaveFeedingLogRequest;
use App\Api\v1\System\Livestock\Actions\SaveMilkingLog\SaveMilkingLogRequest;
use App\Api\v1\System\Livestock\Actions\GetDewormingLogs\GetDewormingLogsAction;
use App\Api\v1\System\Livestock\Actions\GetDryingOffLogs\GetDryingOffLogsAction;
use App\Api\v1\System\Livestock\Actions\GetPregnancyLogs\GetPregnancyLogsAction;
use App\Api\v1\System\Livestock\Actions\SaveDewormingLog\SaveDewormingLogAction;
use App\Api\v1\System\Livestock\Actions\SaveDryingOffLog\SaveDryingOffLogAction;
use App\Api\v1\System\Livestock\Actions\SavePregnancyLog\SavePregnancyLogAction;
use App\Api\v1\System\Livestock\Actions\GetDewormingLogs\GetDewormingLogsRequest;
use App\Api\v1\System\Livestock\Actions\GetDryingOffLogs\GetDryingOffLogsRequest;
use App\Api\v1\System\Livestock\Actions\GetPregnancyLogs\GetPregnancyLogsRequest;
use App\Api\v1\System\Livestock\Actions\SaveDewormingLog\SaveDewormingLogRequest;
use App\Api\v1\System\Livestock\Actions\SaveDryingOffLog\SaveDryingOffLogRequest;
use App\Api\v1\System\Livestock\Actions\SavePregnancyLog\SavePregnancyLogRequest;
use App\Api\v1\System\Livestock\Actions\GetMedicationLogs\GetMedicationLogsAction;
use App\Api\v1\System\Livestock\Actions\SaveMedicationLog\SaveMedicationLogAction;
use App\Api\v1\System\Livestock\Actions\GetMedicationLogs\GetMedicationLogsRequest;
use App\Api\v1\System\Livestock\Actions\SaveMedicationLog\SaveMedicationLogRequest;
use App\Api\v1\System\Livestock\Actions\GetVaccinationLogs\GetVaccinationLogsAction;
use App\Api\v1\System\Livestock\Actions\SaveVaccinationLog\SaveVaccinationLogAction;
use App\Api\v1\System\Livestock\Actions\GetVaccinationLogs\GetVaccinationLogsRequest;
use App\Api\v1\System\Livestock\Actions\SaveVaccinationLog\SaveVaccinationLogRequest;
use App\Api\v1\System\Livestock\Actions\GetInseminationLogs\GetInseminationLogsAction;
use App\Api\v1\System\Livestock\Actions\GetLivestockProfile\GetLivestockProfileAction;
use App\Api\v1\System\Livestock\Actions\SaveInseminationLog\SaveInseminationLogAction;
use App\Api\v1\System\Livestock\Actions\GetInseminationLogs\GetInseminationLogsRequest;
use App\Api\v1\System\Livestock\Actions\GetLivestockProfile\GetLivestockProfileRequest;
use App\Api\v1\System\Livestock\Actions\SaveInseminationLog\SaveInseminationLogRequest;

class FarmerController extends Controller {
    public function splash() {
        return response()->json(FarmerSplashAction::handle());
    }

    public function login(LoginFormRequest $request) {
        return response()->json(FarmerLoginAction::handle($request));
    }

    public function register(FarmerRegisterRequest $request) {
        return response()->json(FarmerRegisterAction::handle($request));
    }


    public function createFarm(CreateFarmRequest $request) {
        return response()->json(CreateFarmAction::handle($request));
    }

    public function getFarms(GetFarmsRequest $request) {
        return response()->json(GetFarmsAction::handle($request));
    }

    public function farmProfile(FarmProfileRequest $request) {
        return response()->json(FarmProfileAction::handle($request));
    }

    public function createLivestock(SaveLivestockRequest $request) {
        return response()->json(SaveLivestockAction::handle($request));
    }

    public function editLivestock(EditLivestockRequest $request) {
        return response()->json(EditLivestockAction::handle($request));
    }

    public function deleteLivestock(DeleteLivestockRequest $request) {
        return response()->json(DeleteLivestockAction::handle($request));
    }

    public function editFarm(EditFarmRequest $request) {
        return response()->json(EditFarmAction::handle($request));
    }

    public function deleteFarm(DeleteFarmRequest $request) {
        return response()->json(DeleteFarmAction::handle($request));
    }

    public function verifyTag(VerifyTagRequest $request) {
        return response()->json(VerifyTagAction::handle($request));
    }

    public function inviteOfficer(InviteOfficerRequest $request) {
        return response()->json(InviteOfficerAction::handle($request));
    }

    public function registerFarmUser(RegisterFarmUserRequest $request) {
        return response()->json(RegisterFarmUserAction::handle($request));
    }

    public function getFarmUsers(GetFarmUsersRequest $request) {
        return response()->json(GetFarmUsersAction::handle($request));
    }

    public function getExtensionOfficers(GetExtensionOfficersRequest $request) {
        return response()->json(GetExtensionOfficersAction::handle($request));
    }

    public function getMilkingLogs(GetMilkingLogsRequest $request) {
        return response()->json(GetMilkingLogsAction::handle($request));
    }

    public function saveMilkingLog(SaveMilkingLogRequest $request) {
        return response()->json(SaveMilkingLogAction::handle($request));
    }

    public function saveDisposalLog(SaveDisposalRequest $request) {
        return response()->json(SaveDisposalAction::handle($request));
    }

    public function getLivestockProfile(GetLivestockProfileRequest $request) {
        return response()->json(GetLivestockProfileAction::handle($request));
    }

    public function saveVaccinationLog(SaveVaccinationLogRequest $request) {
        return response()->json(SaveVaccinationLogAction::handle($request));
    }

    public function getVaccinationLogs(GetVaccinationLogsRequest $request) {
        return response()->json(GetVaccinationLogsAction::handle($request));
    }

    public function saveFeedingLog(SaveFeedingLogRequest $request) {
        return response()->json(SaveFeedingLogAction::handle($request));
    }

    public function getFeedingLogs(GetFeedingLogsRequest $request) {
        return response()->json(GetFeedingLogsAction::handle($request));
    }

    public function getInseminationLogs(GetInseminationLogsRequest $request) {
        return response()->json(GetInseminationLogsAction::handle($request));
    }

    public function saveInseminationLog(SaveInseminationLogRequest $request) {
        return response()->json(SaveInseminationLogAction::handle($request));
    }

    public function savePregnancyLog(SavePregnancyLogRequest $request) {
        return response()->json(SavePregnancyLogAction::handle($request));
    }

    public function getPregnancyLogs(GetPregnancyLogsRequest $request) {
        return response()->json(GetPregnancyLogsAction::handle($request));
    }

    public function saveCalvingLog(SaveCalvingLogRequest $request) {
        return response()->json(SaveCalvingLogAction::handle($request));
    }

    public function getCalvingLogs(GetCalvingLogsRequest $request) {
        return response()->json(GetCalvingLogsAction::handle($request));
    }

    public function saveDryingOffLog(SaveDryingOffLogRequest $request) {
        return response()->json(SaveDryingOffLogAction::handle($request));
    }

    public function getDryingOffLogs(GetDryingOffLogsRequest $request) {
        return response()->json(GetDryingOffLogsAction::handle($request));
    }

    public function saveWeightLog(SaveWeightLogRequest $request) {
        return response()->json(SaveWeightLogAction::handle($request));
    }

    public function getWeightLogs(GetWeightLogsRequest $request) {
        return response()->json(GetWeightLogsAction::handle($request));
    }

    public function saveMedicationLog(SaveMedicationLogRequest $request) {
        return response()->json(SaveMedicationLogAction::handle($request));
    }

    public function getMedicationLogs(GetMedicationLogsRequest $request) {
        return response()->json(GetMedicationLogsAction::handle($request));
    }

    public function saveDewormingLog(SaveDewormingLogRequest $request) {
        return response()->json(SaveDewormingLogAction::handle($request));
    }

    public function getDewormingLogs(GetDewormingLogsRequest $request) {
        return response()->json(GetDewormingLogsAction::handle($request));
    }

    public function getUserRoles(GetUserRolesRequest $request) {
        return response()->json(GetUserRolesAction::handle($request));
    }


    // vaccine inventory
    public function saveVaccinationInventory(VaccineRequest $request) {
        return response()->json(VaccineAction::handle($request));
    }

    public function getVaccinationInventory(GetVaccineRequest $request) {
        return response()->json(GetVaccineAction::handle($request));
    }
}
