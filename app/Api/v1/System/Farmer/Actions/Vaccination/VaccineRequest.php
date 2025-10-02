<?php

namespace App\Api\v1\System\Farmer\Actions\Vaccination;

use Illuminate\Foundation\Http\FormRequest;

class VaccineRequest extends FormRequest
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
            'farmId' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'lot' => 'required|string|max:255',
            'formulationType' => 'required|string|in:live-attenuated,inactivated',
            'dose' => 'required|string|max:255',
            'batchNumber' => 'required|string|max:255',
            'quantity' => 'required|integer|min:1',
            'expiryDate' => 'required|date|after_or_equal:today',
        ];
    }
}
