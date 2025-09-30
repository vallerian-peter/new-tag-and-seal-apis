<?php

use App\Models\Farmer;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/officer-registration', function () {
    $genders = \App\Models\Gender::all();
    $schoolLevels = \App\Models\SchoolLevel::all();
    $idCardTypes = \App\Models\IdentityCardType::all();
    $countries = \App\Models\Country::all();
    $regions = \App\Models\Region::all();
    $districts = \App\Models\District::all();
    $wards = \App\Models\Ward::all();

    return view('officer-registration', [
        'genders' => $genders,
        'schoolLevels' => $schoolLevels,
        'idCardTypes' => $idCardTypes,
        'countries' => $countries,
        'regions' => $regions,
        'districts' => $districts,
        'wards' => $wards,
    ]);
});

