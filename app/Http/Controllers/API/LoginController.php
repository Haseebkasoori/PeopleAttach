<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User; 
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    
    public function login(LoginRequest $request){
        
        $request_data=$request->validated();

        $user=User::where('email',$request_data['email'])->first();
        if (!empty($user['password'])) {
            if (Hash::check($request_data['password'], $user->password)) {
                $user = User::where('email',$request_data['email'])->first();
                
                // Creating JWT token
                $jwt_token=(new JwtController)->createJwtToken($user);

                // save JWT token in DB
                $user->jwt_token= $jwt_token['token'];
                try{
                    $update=$user->update();
                    // data creation for response
                    $response_data['message']=strtoupper($user->user_name).' Welcome to the Application!!';
                    $response_data['token_type']="Bearer";
                    $response_data['Authenticaiton']=$jwt_token['token'];
                    return response()->success($response_data,200);
                }catch(\Exception $ex){
                    $resonse_data['error']=$ex->getMessage();
                    $resonse_data['message']="Someting went Worng";
                    return response()->error($resonse_data,500);
                }                
            }else{
                $resonse_data['error']="Incorrect Password";
                $resonse_data['message']="Someting went Worng";
                return response()->error($resonse_data,404);
            } 
        }else{
            $resonse_data['error']="Email not Register";
            $resonse_data['message']="Someting went Worng";
            return response()->error($resonse_data,404);
        } 
    }
 
    //logout
    public function logout(Request $request){
        $decoded_data=(new JwtController)->varifyToken($token);
        $user=User::where("jwt_token",$token)->first();
        
        // remove jwt token from database
        $user->jwt_token=Null;
        $update_data=$user->update();
        
        if (!$update_data) {
            $resonse_data['error']="Have some Problem in Logout";
            $resonse_data['message']="Someting went Worng";
            return response()->error($resonse_data,404);
        }else{
            // data creation for response
            $resonse_data['data']=Null; 
            $resonse_data['message']='Logout Successfully';
            return response()->success($resonse_data,200);
        }    
        
    }
   
}
