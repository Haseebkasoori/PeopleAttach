<?php

namespace App\Http\Controllers\API;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\UpdateUserRequest; 
use App\Http\Requests\SearchUserReqeust; 
use App\Http\Requests\GetUserRequest; 
use Illuminate\Http\Request; 
use App\Models\User;
use App\Http\Controllers\Controller; 


class UserController extends Controller
{

    //update users data
    public function UpdateUser(UpdateUserRequest $request){
        $input_data=$request->validated();
        $decoded_data=(new JwtController)->varifyToken($token);
        // getting user data
        
        $user_data = User::find($decoded_data->data->id);
        if(!empaty($user_data['id'])){
            $user_data->user_name = $input_data['user_name'];
            $user_data->first_name = $input_data['first_name'];
            $user_data->last_name = $input_data['last_name'];
            $user_data->phone_number = $input_data['phone_number'];
            $file_name = null;
            if (!empty($input_data['profile_image'])) {
                // converting base64 decoded image to simple image
                // upload path
                $destinationPath = storage_path('\app\public\users\\'); 
                $image_parts = explode(";base64,", $input_data['profile_image']);
                $image_type_aux = explode("image/", $image_parts[0]);
                $image_type = $image_type_aux[1];
                $image_base64 = base64_decode($image_parts[1]);
                $file_name=uniqid() . '.'.$image_type;
                $file = $destinationPath . $file_name;
                // saving in local storage
                file_put_contents($file, $image_base64);  
            }
            $user_data->save();
            $response_data['data']= $user_data;
            $response_data['message']=$user->name . ' with id # ' . $user->id . ' Updated Successfully!';
            return response()->success($response_data,200);
        }else{
            $data['error']='User not Exists';
            $data['message']="Someting went Worng";
            return response()->error($data,404);
        }
}

    //Delete User
    public function DeleteUser(){
        $decoded_data=(new JwtController)->varifyToken($token);
        // getting user data
        
        $user_data = User::find($decoded_data->data->id);
        if($user_data){
            $user_data->delete();
            $response_data['data']= "Profile Deleted Successfully";
            $response_data['message']='Delete Successfully';
            return response()->success($response_data,200);
        }else{
            $data['error']='User not Exists';
            $data['message']="Someting went Worng";
            return response()->error($data,404);
    }
}

    //Search User
    public function SearchUser(SearchUserReqeust $reqeust)
    {
        $input_data=$request->validated();
        $user_data=User::where('user_name','like','%'.$input_data['data'].'%')->orWhere('first_name','like','%'.$input_data['data'].'%')->orWhere('last_name','like','%'.$input_data['data'].'%')->get();
        $response_data['message']='User Data';
        $response_data['data']= $user_data;
        return response()->success($response_data,200);
    }

    //Fetch Single user data
    public function GetUser(GetUserRequest $request)
    {
        $input_data=$request->validated();
        $user_data=User::find($input_data['id']);
        $response_data['message']='User Data';
        $response_data['data']= $user_data;
        return response()->success($response_data,200);
    }

    //Fetch all users data
    public function GetAllUsers(Request $request)
    {
        $user_data=User::all();

        $response_data['message']='Users Data';
        $response_data['data']= $user_data;
        return response()->success($response_data,200);
    }
}