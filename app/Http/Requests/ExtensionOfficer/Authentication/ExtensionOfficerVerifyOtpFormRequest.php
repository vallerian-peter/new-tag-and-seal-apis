<?php

namespace App\Http\Requests\ExtensionOfficer\Authentication;

use Illuminate\Foundation\Http\FormRequest;

class ExtensionOfficerVerifyOtpFormRequest extends FormRequest{
    public function authorize():bool{
        return true;
    }

    public function rules():array
    {
        return [
            'otpValue'=>'required',
            'email'=>'required',
        ];
    }

}