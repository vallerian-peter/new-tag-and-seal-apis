@extends('layouts.app')
@section('content')
    <div class="row mt-3">
        <div class="col-md-12 col-lg-12">
            <div class="d-flex justify-content-between align-items-center">
                <h4 class="page-title" style="font-size: 1.8em;">Extension Officer Registration</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8 col-lg-8">
            <div class="card mt-3">
                <div class="card-content">
                    <div class="card-body">
                        <form action="{{ route('register') }}" id="createNewExtensionOfficerForm" name="createNewExtensionOfficerForm"
                              method="post">
                            @csrf
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="section_one">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <span class="text-start text-muted"
                                                  style="font-weight: 500; font-size: 1.3em;">PERSONAL INFORMATIONS</span>
                                            <h5
                                                style="font-size: 0.95em; color: #3a5a40; background-color: #d8ded9; padding: 0.65em; border-radius: 8px;">
                                                STEP 1/2</h5>
                                        </div>
                                        <div class="row" style="margin-top: -5px;">
                                            <div class="col-md-12 col-lg-12">
                                                <div class="form-fields">
                                                    <div class="row mt-3">
                                                        <div class="col-md-12 col-lg-12">
                                                            <div class="mb-3">
                                                                <label for="name" class="form-label">Name</label>
                                                                <input type="text" id="name" name="name"
                                                                       placeholder="Enter name" class="form-control" required>
                                                                <small class="text-danger" id="error_name"></small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="dob" class="form-label">Date of
                                                                    brith</label>
                                                                <input class="form-control" id="dob" type="date"
                                                                       name="dob">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="gender" class="form-label">Gender</label>
                                                                <select class="form-control select2" id="gender"
                                                                        name="gender" data-toggle="select2">
                                                                    <optgroup label="Genders">
                                                                        <option style="font-weight: bold;">Select
                                                                            gender</option>
                                                                        @foreach ($genders as $gender)
                                                                            <option value="{{ $gender->id }}">
                                                                                {{ $gender->name }}
                                                                            </option>
                                                                        @endforeach
                                                                    </optgroup>
                                                                </select>
                                                                <small class="text-danger" id="error_gender"></small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="medical_licence_no" class="form-label">Medical
                                                                    Licence
                                                                    No</label>
                                                                <input type="text" id="medical_licence_no"
                                                                       name="medical_licence_no" placeholder="Enter licence no"
                                                                       class="form-control" required>
                                                                <small class="text-danger"
                                                                       id="error_medical_licence_no"></small>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-lg-6">
                                                            <div class="mb-3">
                                                                <label for="education_level" class="form-label">Education
                                                                    Level</label>
                                                                <select class="form-control select2" id="education_level"
                                                                        name="education_level" data-toggle="select2">
                                                                    <optgroup label="Education Levels">
                                                                        <option style="font-weight: bold;">Select
                                                                            education level</option>
                                                                        @foreach ($schoolLevels as $level)
                                                                            <option value="{{ $level->id }}">
                                                                                {{ $level->name }}
                                                                            </option>
                                                                        @endforeach
                                                                    </optgroup>
                                                                </select>
                                                                <small class="text-danger"
                                                                       id="error_education_level"></small>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="d-flex justify-content-between align-items-center">
                                            <span class="text-start text-muted"
                                                  style="font-weight: 500; font-size: 1.3em;">CONTACT INFORMATIONS</span>
                                                        <h5
                                                            style="font-size: 0.95em; color: #3a5a40; background-color: #d8ded9; padding: 0.65em; border-radius: 8px;">
                                                            STEP 2/2</h5>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12 col-lg-12">
                                                            <div class="form-fields">
                                                                <div class="row mt-3">
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="phone_1" class="form-label">Phone 1</label>
                                                                            <input type="text" id="phone_1" name="phone_1"
                                                                                   placeholder="Enter phone 1" class="form-control"
                                                                                   required>
                                                                            <small class="text-danger" id="error_phone_1"></small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="phone_2" class="form-label">Phone 2</label>
                                                                            <input type="text" id="phone_2" name="phone_2"
                                                                                   placeholder="Enter phone 2" class="form-control"
                                                                                   required>
                                                                            <small class="text-danger" id="error_phone_2"></small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="email" class="form-label">Email</label>
                                                                            <input type="email" id="email" name="email"
                                                                                   placeholder="Enter email" class="form-control"
                                                                                   required>
                                                                            <small class="text-danger" id="error_email"></small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-12 col-lg-12">
                                                                        <div class="mb-3">
                                                                            <label for="address" class="form-label">Address</label>
                                                                            <input type="text" id="address" name="address"
                                                                                   placeholder="Enter address" class="form-control"
                                                                                   required>
                                                                            <small class="text-danger" id="error_address"></small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6 col-lg-6">
                                                                        <div class="mb-3">
                                                                            <label for="id_card_type" class="form-label">ID card
                                                                                Type</label>
                                                                            <select class="form-control select2" id="id_card_type"
                                                                                    name="id_card_type" data-toggle="select2">
                                                                                <optgroup label="ID Card Types">
                                                                                    <option style="font-weight: bold;">Select
                                                                                        id card type</option>
                                                                                    @foreach ($idCardTypes as $type)
                                                                                        <option value="{{ $type->id }}">
                                                                                            {{ $type->name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </optgroup>
                                                                            </select>
                                                                            <small class="text-danger"
                                                                                   id="error_id_card_type"></small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6 col-lg-6">
                                                                        <div class="mb-3">
                                                                            <label for="id_number" class="form-label">ID
                                                                                Number</label>
                                                                            <input type="text" id="id_number" name="id_number"
                                                                                   placeholder="Enter id number" class="form-control"
                                                                                   required>
                                                                            <small class="text-danger" id="error_id_number"></small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="name" class="form-label">Country</label>
                                                                            <select class="form-control select2" id="country"
                                                                                    name="country" data-toggle="select2">
                                                                                <optgroup label="Countries">
                                                                                    <option style="font-weight: bold;">Select
                                                                                        country</option>
                                                                                    @foreach ($countries as $country)
                                                                                        <option value="{{ $country->id }}">
                                                                                            {{ $country->name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </optgroup>
                                                                            </select>
                                                                            <small class="text-danger" id="error_country"></small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="region" class="form-label">Region</label>
                                                                            <select class="form-control select2" id="region"
                                                                                    name="region" data-toggle="select2">
                                                                                <optgroup label="Countries">
                                                                                    <option style="font-weight: bold;">Select
                                                                                        region</option>
                                                                                    @foreach ($regions as $region)
                                                                                        <option value="{{ $region->id }}">
                                                                                            {{ $region->name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </optgroup>
                                                                            </select>
                                                                            <small class="text-danger" id="error_region"></small>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-4 col-lg-4">
                                                                        <div class="mb-3">
                                                                            <label for="name" class="form-label">District</label>
                                                                            <select class="form-control select2" id="district"
                                                                                    name="district" data-toggle="select2">
                                                                                <optgroup label="Districts">
                                                                                    <option style="font-weight: bold;">Select
                                                                                        district</option>
                                                                                    @foreach ($districts as $district)
                                                                                        <option value="{{ $district->id }}">
                                                                                            {{ $district->name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </optgroup>
                                                                            </select>
                                                                            <small class="text-danger" id="error_district"></small>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="d-flex justify-content-end align-items-center mt-2">
                                                                    <button type="submit"
                                                                            class="btn btn-success saveBtn">Save
                                                                        details</button>
                                                                    <button class="btn btn-success btnLoading" type="button"
                                                                            style="display: none" disabled>
                                                            <span class="spinner-grow spinner-grow-sm me-1" role="status"
                                                                  aria-hidden="true"></span>
                                                                        Loading...
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
