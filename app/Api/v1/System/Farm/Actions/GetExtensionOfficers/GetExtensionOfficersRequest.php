<?php

namespace App\Api\v1\System\Farm\Actions\GetExtensionOfficers;

use Illuminate\Foundation\Http\FormRequest;

class GetExtensionOfficersRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'farmId' => 'required|integer|exists:farms,id',
            'farm_id' => 'sometimes|integer|exists:farms,id', // Alternative field name
        ];
    }

    public function messages()
    {
        return [
            'farmId.required' => 'The farm ID field is required.',
            'farmId.integer' => 'The farm ID must be an integer.',
            'farmId.exists' => 'The selected farm does not exist.',
        ];
    }
}

