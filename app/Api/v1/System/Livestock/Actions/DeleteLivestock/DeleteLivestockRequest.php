<?php

namespace App\Api\v1\System\Livestock\Actions\DeleteLivestock;

use Illuminate\Foundation\Http\FormRequest;

class DeleteLivestockRequest extends FormRequest
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
            'nida' => 'required|string|exists:livestocks,identification_number',
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
            'nida.required' => 'Livestock identification number is required.',
            'nida.exists' => 'Livestock not found.',
        ];
    }
}
