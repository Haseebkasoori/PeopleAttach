<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class JwtAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $token=request()->bearerToken();        
        $secret_key="sumaila";
        try{
            $decoded = JWT::decode($token, new Key($secret_key, 'HS256'));
            $token_exist= DB::select("select * from auth_token where user_id='{$decoded->data->id}'");
            if(!$token_exist){
                return response()->json(['error'=>'Already Logout'], 404);
            }else{
                
                return $next($request);
            }
        }catch(\Exception $ex){
            $data['error']=$ex->getMessage();
            $data['message']="Someting went Worng with Bearer Token";
            return response()->json($data, 404);
        }
    }
}
