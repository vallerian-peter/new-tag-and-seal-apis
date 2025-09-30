<?php

namespace App\Http\Requests\ExtensionOfficer\Authentication;

use Illuminate\Foundation\Http\FormRequest;

class ExtensionOfficerVerifyTagFormRequest extends FormRequest
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
            'tag_no' => 'required',
            'officer_id' => 'required',
            'farm_id' => 'required'
        ];
    }
}
