<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller; 
use App\Models\User; 
use Illuminate\Support\Facades\Mail;
use App\Mail\ForgotPassword;
use App\Http\Requests\ForgotRequest;


class ForgotPasswordController extends Controller
{
    public function forgotPassword(ForgotRequest $request)
{
        $input=$request->validated();
        $user_data= User::where('email', $input['email'])->first(); 
        $string="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()1234567890";
        
        $password=substr(str_shuffle(str_repeat($string, 12)), 0, 12);
        $user_data->password=bcrypt($password);
        $user_data->save();
        //for generate link in URL
        
        Mail::to($input['email'])->send(new ForgotPassword($password));
        $response_data['data']=Null; 
        $response_data['message']=' Password Send to Your Mail';
        return response()->success($response_data,200);
}
}
