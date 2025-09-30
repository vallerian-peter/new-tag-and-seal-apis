<?php

use App\Http\Controllers\ExtensionOfficer\ExtensionOfficerController;
use App\Http\Controllers\Farmer\FarmerController;
use App\Http\Controllers\Guest\ScanningController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/**
 * V1 ROUTES
 */
include base_path('app/Api/v1/_Src/v1routes.php');
// include base_path('app/Api/v1/_Src/v1routes.php');

// include __DIR__ . '/../app/Api/v1/_Src/v1routes.php';

/**
 * SYNC ROUTES
 */
include __DIR__ . '/sync.php';

Route::prefix('farmer')->group(function () {
    Route::post('splash', [FarmerController::class, 'getSplash'])->name('splash');
    Route::post('register', [FarmerController::class, 'register'])->name('register');
    Route::post('login', [FarmerController::class, 'login'])->name('login');
    Route::post('dashboard', [FarmerController::class, 'getDashboard'])->name('dashboard');
    Route::post('register_farm', [FarmerController::class, 'registerFarm'])->name('register_farm');
    Route::post('register_farm_user', [FarmerController::class, 'registerUser'])->name('register_farm_user');
    Route::post('log_milking', [FarmerController::class,'logMilking'])->name('log_milking');
    Route::post('get_milking_log', [FarmerController::class,'getMilkingLog'])->name('get_milking_log');
    Route::post('assign_farm_officer', [FarmerController::class, 'assignFarmOfficer'])->name('assign_farm_officer');

    // Vaccination endpoints
    Route::post('farm-save-vaccination-log', [FarmerController::class, 'saveVaccinationLog'])->name('farm_save_vaccination_log');
    Route::post('farm-get-vaccination-logs', [FarmerController::class, 'getVaccinationLogs'])->name('farm_get_vaccination_logs');
    Route::post('farm-save-vaccination-inventory', [FarmerController::class, 'saveVaccinationInventory'])->name('farm_save_vaccination_inventory');
    Route::post('farm-get-vaccination-inventory', [FarmerController::class, 'getVaccinationInventory'])->name('farm_get_vaccination_inventory');

    // Disposal endpoints
    Route::post('farm-save-disposal-log', [FarmerController::class, 'saveDisposalLog'])->name('farm_save_disposal_log');
    Route::post('farm-get-disposal-logs', [FarmerController::class, 'getDisposalLogs'])->name('farm_get_disposal_logs');

    // Backup endpoints for Flutter app compatibility
    Route::post('invite-officer', [FarmerController::class, 'assignFarmOfficer'])->name('invite_officer_backup');
    Route::post('register-farm-user', [FarmerController::class, 'registerUser'])->name('register_farm_user_backup');
});

Route::prefix('officer')->group(function () {
    Route::post('splash', [ExtensionOfficerController::class, 'getSplash'])->name('splash');
    Route::post('register', [ExtensionOfficerController::class, 'register'])->name('register');
    Route::post('login', [ExtensionOfficerController::class, 'login'])->name('login');
    Route::post('dashboard', [ExtensionOfficerController::class, 'getDashboard'])->name('dashboard');
    Route::post('sync_location', [ExtensionOfficerController::class, 'sycnLocation'])->name('sync_location');
    Route::post('verify_tag', [ExtensionOfficerController::class, 'verifyTag'])->name('verify_tag');
    Route::post('register_livestock', [ExtensionOfficerController::class, 'registerLivestock'])->name('register_livestock');
    Route::post('update_livestock',[ExtensionOfficerController::class,'updateLivestock'])->name('update_livestock');
    Route::post('get_livestock',[ExtensionOfficerController::class,'getLivestock'])->name('get_livestock');
    Route::post('log_vaccination', [ExtensionOfficerController::class,'logVaccination'])->name('log_vaccination');
    Route::post('get_vaccination_log', [ExtensionOfficerController::class,'getVaccinationLog'])
    ->name('get_vaccination_log');
    Route::post('log_medication', [ExtensionOfficerController::class,'logMedication'])->name('log_medication');
    Route::post('log_feeding', [ExtensionOfficerController::class,'logFeeding'])->name('log_feeding');
    Route::post('log_pregnancy', [ExtensionOfficerController::class,'logPregnancy'])->name('log_pregnancy');
    Route::post('log_disposal', [ExtensionOfficerController::class,'logDisposal'])->name('log_disposal');
    Route::post('log_drying_off', [ExtensionOfficerController::class,'logDryingOff'])->name('log_drying_off');
    Route::post('log_weight', [ExtensionOfficerController::class,'logWeight'])->name('log_weight');
    Route::post('log_deworming', [ExtensionOfficerController::class,'logDeworming'])->name('log_deworming');
    Route::post('log_calving', [ExtensionOfficerController::class,'logCalving'])->name('log_calving');
    Route::post('log_insemination', [ExtensionOfficerController::class,'logInsemination'])->name('log_insemination');

    //Officer App
    Route::post('register_officer',[ExtensionOfficerController::class,'registerOfficer'])->name('register_officer');
    Route::post('request_otp',[ExtensionOfficerController::class,'requestOtp'])->name('request_otp');
    Route::post('verify_otp',[ExtensionOfficerController::class,'verifyOtp'])->name('verify_otp');
    Route::post('officer_login',
    [ExtensionOfficerController::class,'officerLogin'])->name('officer_login');

    //Officer Farmer Registration
    Route::post('register_farmer',[ExtensionOfficerController::class,'registerFarmer'])->name('register_farmer');
    Route::post('farmerList',[ExtensionOfficerController::class,'getFarmerList'])->name('farmerList');

    //Profile Farmer
    Route::post('farmerProfile',[ExtensionOfficerController::class,'getFarmers'])->name('farmerProfile');

    //Officer Farm Registration
    Route::post('register_farm',[ExtensionOfficerController::class,'registerFarm'])->name('register_farm');
    Route::post('invitedFarms',[ExtensionOfficerController::class,'getInvitedFarms'])->name('invitedFarms');
    Route::post('farmProfile',[ExtensionOfficerController::class,'getFarmProfile'])->name('farmProfile');
    Route::post('invitedFarmProfile',[ExtensionOfficerController::class,'getInvitedFarmProfile'])->name('invitedFarmProfile');
    Route::post('fetchVaccineBatches',[ExtensionOfficerController::class,'getVaccineBatches'])->name('fetchVaccineBatches');

});

Route::prefix('guest')->group(function () {
    Route::post('scan_tag', [ScanningController::class, 'scanTag'])->name('scan_tag');
});

Route::fallback(function () {
    return response()->json([
        'code' => 404,
        'message' => 'Route Not Found'
    ]);
});
