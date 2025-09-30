<?php

namespace App\Api\v1\System\Farmer\Actions\GetFarms;

use Illuminate\Foundation\Http\FormRequest;

class GetFarmsRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'farmer_no' => 'required|string',
        ];
    }

    public function messages()
    {
        return [
            'farmer_no.required' => 'Farmer number is required',
            'farmer_no.string' => 'Farmer number must be a string',
        ];
    }
}
