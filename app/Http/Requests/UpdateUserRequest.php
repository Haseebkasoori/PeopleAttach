<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize() 
    {
        return true;
    }
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'user_name' => 'string|unique:users|max:100',
            'first_name' => 'string|max:100',
            'last_name' => 'string|max:100',
            'password' => 'string|min:8|max:100',
            'phone_number' => 'digits:11|max:100',
            'profile_image' => 'array',
        ];
    }
}