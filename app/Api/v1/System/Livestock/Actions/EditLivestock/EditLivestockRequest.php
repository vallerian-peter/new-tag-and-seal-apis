<?php

namespace App\Api\v1\System\Livestock\Actions\EditLivestock;

use Illuminate\Foundation\Http\FormRequest;

class EditLivestockRequest extends FormRequest
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
            'name' => 'nullable|string|max:255',
            'nida' => 'required|string',
            'livestock_type' => 'nullable|integer',
            'specie' => 'nullable|integer',
            'breed' => 'nullable|integer',
            'dob' => 'nullable|date',
            'gender' => 'required|integer',
            'mother' => 'nullable|integer',
            'father' => 'nullable|integer',
            'livestock_stage' => 'nullable|integer',
            'livestock_obtained_method' => 'nullable|integer',
            'date_entered_farm' => 'nullable|date',
            'weight' => 'nullable|numeric|min:0',
            'animal_picture' => 'nullable|file|image|max:2048',
            'farm_tag' => 'nullable|string',
            'farm_id' => 'nullable|integer',
        ];
    }
}
