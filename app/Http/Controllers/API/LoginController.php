<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\User; 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public $successStatus = 200;
    
    
    public function login( Request $request){
        $user=User::where('email',request('email'))->first();
        if (!empty($user['password'])) {
            if (Hash::check(request('password'), $user->password)) {
                $user_data['email'] = $user->email;
                $user_data['name'] = $user->name;
                $user_data['id'] = $user->id; 
                $secret_key="sumaila";
                $iss = "SocialApp";
                $iat = time();
                $nbf = $iat+10;
                $exp = $iat+1800;
                $aud = "App User";
                
                $payload_info= array(
                    "iss" =>$iss,
                    "iat" =>$iat,
                    "nbf" =>$nbf,
                    "exp" =>$exp,
                    "aud" =>$aud,
                    "data" =>$user_data
                );
                $Auth_key = JWT::encode($payload_info,$secret_key);
                try{
                    DB::insert('insert into auth_token (token, user_id) values (?, ?)', [$Auth_key,$user->id]);
                }catch(\Exception $ex){
                    return response()->json(['error'=>$ex->getMessage()], 500);                    
                }
                $data['success']='User signin!!!';
                $data['Authentication']=$Auth_key;
                return response()->json($data, $this-> successStatus); 
            
            }else{
                return response()->json(['error'=>'Incorrect Password'], 401);
            } 

        }else{
            return response()->json(['error'=>'Email not Register'], 401);
        } 
    }
 
    //logout
    public function logout(Request $request){
        $token = $request->bearerToken();
        try {
                $decoded_data=JWT::decode($token, new Key("sumaila", 'HS256'));
                DB::delete("delete from auth_token where user_id='{$decoded_data->data->id}'");
                return response()->json(['success'=>'Logout Successfully!!'], $this-> successStatus); 
        }catch (\Exception $e) {
            return response()->json(['error'=>$e->getMessage()], 500);                    
        }
    }
   
}
