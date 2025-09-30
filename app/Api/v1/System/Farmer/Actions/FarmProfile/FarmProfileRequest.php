<?php

namespace App\Api\v1\System\Farmer\Actions\FarmProfile;

use Illuminate\Foundation\Http\FormRequest;

class FarmProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'farmerId' => 'required',
            'farmId' => 'required'
        ];
    }
}
