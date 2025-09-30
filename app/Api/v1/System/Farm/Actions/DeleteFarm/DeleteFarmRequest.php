<?php

namespace App\Api\v1\System\Farm\Actions\DeleteFarm;

use Illuminate\Foundation\Http\FormRequest;

class DeleteFarmRequest extends FormRequest
{
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
            'farm_id' => 'required|integer|exists:farms,id',
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array
     */
    public function messages(): array
    {
        return [
            'farm_id.required' => 'Farm ID is required.',
            'farm_id.exists' => 'Farm not found.',
        ];
    }
}
