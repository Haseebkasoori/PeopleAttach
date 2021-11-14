<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Models\User; 
use App\Mail\testMail;
use App\Http\Requests\RegistrationRequest;
use Illuminate\Support\Facades\Mail;

class RegistrationController extends Controller
{
    public $successStatus = 200;
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
        $success['name'] =  $user->name . " register successfully! for verifying please chk your email";
        return response()->json(['success'=>$success], $this-> successStatus); 
}
    //verifying email
    public function verifyingEmail($email,$token){
        $user=User::where('email',$email)->first();
        if (!empty($user['name'])) {
            if ($token == $user['verification_token']) {
                $user->verification_token = null;
                $user->email_verified_at = date('Y-m-d h:i:s');
                $user->update();
                $data['success']='Email Verified!!!';
                return response()->json($data, $this-> successStatus); 
            }
            else{
                return response()->json(['error'=>'Verification link already used!'], 401);
            }
        }
        else{
            return response()->json(['error'=>'Email not Register'], 401);
        }
    }
}
