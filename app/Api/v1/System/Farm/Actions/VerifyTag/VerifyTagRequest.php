<?php

namespace App\Api\v1\System\Farm\Actions\VerifyTag;

use Illuminate\Foundation\Http\FormRequest;

class VerifyTagRequest extends FormRequest
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
            'tagNo' => 'required',
            'farmId' => 'required'
        ];
    }
}
