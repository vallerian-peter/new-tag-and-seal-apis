<?php

use App\Api\v1\System\Farmer\FarmerController;
use App\Api\v1\System\Farm\FarmUserController;
use App\Http\Controllers\Farmer\FarmerController as HttpFarmerController;
use Illuminate\Support\Facades\Route;

Route::prefix('/v1')->group(function () {
    Route::prefix('/farmer')->group(function () {
        Route::post('/splash', [FarmerController::class, 'splash'])->name('farmer.splash');
        Route::post('/login', [FarmerController::class, 'login'])->name('farmer.login')->middleware('guest');
        Route::post('/register', [FarmerController::class, 'register'])->name('farmer.register')->middleware('guest');

        Route::middleware(['auth:api'])->group(function () {
            Route::post('/create-farm', [FarmerController::class, 'createFarm'])->name('farmer.createFarm');
            Route::post('/edit-farm', [FarmerController::class, 'editFarm'])->name('farmer.editFarm');
            Route::post('/delete-farm', [FarmerController::class, 'deleteFarm'])->name('farmer.deleteFarm');
            Route::post('/get-farms', [FarmerController::class, 'getFarms'])->name('farmer.getFarms');
            Route::post('/farm-profile', [FarmerController::class, 'farmProfile'])->name('farmer.farmProfile');
            Route::post('/farm-create-livestock', [FarmerController::class, 'createLivestock'])->name('farmer.createLivestock');
            Route::post('/farm-edit-livestock', [FarmerController::class, 'editLivestock'])->name('farmer.editLivestock');
            Route::post('/farm-delete-livestock', [FarmerController::class, 'deleteLivestock'])->name('farmer.deleteLivestock');
            Route::post('/farm-verify-tag', [FarmerController::class, 'verifyTag'])->name('farmer.verifyTag');
            Route::post('/farm-invite-officer', [FarmerController::class, 'inviteOfficer'])->name('farmer.inviteOfficer');
            Route::post('/farm-register-user', [FarmerController::class, 'registerFarmUser'])->name('farmer.registerFarmUser');
            Route::post('/farm-get-invited-users', [FarmerController::class, 'getFarmUsers'])->name('farmer.getFarmUsers');
            Route::post('/farm-get-extension-officers', [FarmerController::class, 'getExtensionOfficers'])->name('farmer.getExtensionOfficers');
            Route::post('/farm-save-milking-log', [FarmerController::class, 'saveMilkingLog'])->name('farmer.saveMilkingLog');
            Route::post('/farm-get-milking-logs', [FarmerController::class, 'getMilkingLogs'])->name('farmer.getMilkingLogs');
            Route::post('/farm-save-disposal-log', [FarmerController::class, 'saveDisposalLog'])->name('farmer.saveDisposalLog');
            Route::post('/farm-get-disposal-logs', [HttpFarmerController::class, 'getDisposalLogs'])->name('farmer.getDisposalLogs');
            Route::post('/farm-get-livestock-profile', [FarmerController::class, 'getLivestockProfile'])->name('farmer.getLivestockProfile');
            Route::post('/farm-get-vaccination-logs', [FarmerController::class, 'getVaccinationLogs'])->name('farmer.getVaccinationLogs');
            Route::post('/farm-save-vaccination-log', [FarmerController::class, 'saveVaccinationLog'])->name('farmer.saveVaccinationLog');
            Route::post('/farm-save-feeding-log', [FarmerController::class, 'saveFeedingLog'])->name('farmer.saveFeedingLog');
            Route::post('/farm-get-feeding-logs', [FarmerController::class, 'getFeedingLogs'])->name('farmer.getFeedingLogs');
            Route::post('/farm-save-insemination-log', [FarmerController::class, 'saveInseminationLog'])->name('farmer.saveInseminationLog');
            Route::post('/farm-get-insemination-logs', [FarmerController::class, 'getInseminationLogs'])->name('farmer.getInseminationLogs');
            Route::post('/farm-save-pregnancy-log', [FarmerController::class, 'savePregnancyLog'])->name('farmer.savePregnancyLog');
            Route::post('/farm-get-pregnancy-logs', [FarmerController::class, 'getPregnancyLogs'])->name('farmer.getPregnancyLogs');
            Route::post('/farm-save-calving-log', [FarmerController::class, 'saveCalvingLog'])->name('farmer.saveCalvingLog');
            Route::post('/farm-get-calving-logs', [FarmerController::class, 'getCalvingLogs'])->name('farmer.getCalvingLogs');
            Route::post('/farm-save-drying-off-log', [FarmerController::class, 'saveDryingOffLog'])->name('farmer.saveDryingOffLog');
            Route::post('/farm-get-drying-off-logs', [FarmerController::class, 'getDryingOffLogs'])->name('farmer.getDryingOffLogs');
            Route::post('/farm-save-weight-log', [FarmerController::class, 'saveWeightLog'])->name('farmer.saveWeightLog');
            Route::post('/farm-get-weight-logs', [FarmerController::class, 'getWeightLogs'])->name('farmer.getWeightLogs');
            Route::post('/farm-save-medication-log', [FarmerController::class, 'saveMedicationLog'])->name('farmer.saveMedicationLog');
            Route::post('/farm-get-medication-logs', [FarmerController::class, 'getMedicationLogs'])->name('farmer.getMedicationLog');
            Route::post('/farm-save-deworming-log', [FarmerController::class, 'saveDewormingLog'])->name('farmer.saveDewormingLog');
            Route::post('/farm-get-deworming-logs', [FarmerController::class, 'getDewormingLogs'])->name('farmer.getDewormingLogs');

            Route::post('/get-user-roles', [FarmerController::class, 'getUserRoles'])->name('farmer.getUserRoles');
            Route::post('/get_user_roles', [FarmerController::class, 'getUserRoles'])->name('farmer.getUserRolesBackup');

            Route::post('/farm-save-vaccination-inventory', [FarmerController::class, 'saveVaccinationInventory'])->name('farmer.saveVaccinationInventory');
            Route::post('/farm-get-vaccination-inventory', [FarmerController::class, 'getVaccinationInventory'])->name('farmer.getVaccinationInventory');
        });
    });

    // Farm-user auth
    Route::prefix('/farm-user')->group(function () {
        Route::post('/login', [FarmUserController::class, 'login'])->name('farmUser.login')->middleware('guest');
    });
});
