<?php

namespace App\Http\Controllers\API;


use App\Http\Requests\RegistrationRequest;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;
use App\Mail\RegistrationMail;
use App\Models\User; 


class RegistrationController extends Controller
{
    /** 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(RegistrationRequest $request)
    {   
            $input=$request->validated();
            $input['password'] = bcrypt($input['password']); 
            $verification_token=md5($input['name']);  //for encoding
            $gender = $input['gender'];
            $input['verification_token']=$verification_token;
            $file_name=null; 
            // converting base64 decoded image to simple image if exist
            if (!empty($input['profile_image'])) {
                // upload Attachment
                $destinationPath = storage_path('\app\public\users\\'); 
                $input_type_aux = explode("/", $input['profile_image']['mime']);
                $attachment_type=$input_type_aux[0];
                $attachment_extention=$input_type_aux[1];
                $image_base64 = base64_decode($input['profile_image']['data']);
                $file_name=$input['name'].uniqid() . '.'.$attachment_extention;
                $file = $destinationPath . $file_name;
                // saving in local storage
                file_put_contents($file, $image_base64);
            }
            $input['profile_image'] = $file_name;
            $user = User::create($input); 
            $data['verification_token']=$verification_token;
            $data['email']=$input['email'];
            $data['gender'] = $input['gender'];
            //for generate link in URL
            $data['link']=url('api/emailConfirmation/'.$input['email'].'/'.$verification_token);
            Mail::to($input['email'])->send(new testMail($data));
            
            // data creation for response
            $response_data['data']=Null;
            $response_data['message']=strtoupper($user->user_name).', Please check your mail ('.$user->email.') for Email Varification';
            return response()->success($response_data,200);

    }
    //verifying email
    public function verifyingEmail($email,$token){
        $user=User::where('email',$email)->first();
        if (!empty($user['name'])) {
            if ($token == $user['verification_token']) {
                $user->verification_token = null;
                $user->email_verified_at = date('Y-m-d h:i:s');
                $user->update();
                $response_data['data']=Null;
                $response_data['message']=$user->user_name.' Your Account Has Been Verified';
                return response()->success($response_data,200);
            }
            else{
                $data['error']='Verification link already used!';
                $data['message']="Someting went Worng";
                return response()->error($data,404);
            }
        }
        else{
            
            $data['error']='Email not Register!';
            $data['message']="Someting went Worng";
            return response()->error($data,404);

        }
    }
}

