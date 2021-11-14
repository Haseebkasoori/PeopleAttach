<?php

namespace App\Http\Controllers\API;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller; 
use Illuminate\Http\Request; 
use App\Models\User;


class UserController extends Controller
{
public $successStatus = 200;

    //update users data
    public function UpdateUser(Request $request, $id){
    $user = User::find($id);
    $user->name = $request->input('name');
    $user->email = $request->input('email');
    $user->age = $request->input('age');
    $user->date_of_birth = $request->input('date_of_birth');
    $file_name = null;
    if (!empty($request['profile_image'])) {
        // converting base64 decoded image to simple image
        // upload path
        $destinationPath = storage_path('\app\public\users\\'); 
        $image_parts = explode(";base64,", $request['profile_image']);
        $image_type_aux = explode("image/", $image_parts[0]);
        $image_type = $image_type_aux[1];
        $image_base64 = base64_decode($image_parts[1]);
        $file_name=uniqid() . '.'.$image_type;
        $file = $destinationPath . $file_name;
        // saving in local storage
        file_put_contents($file, $image_base64);  
    }
    $user->save();
    return response()->json([
        "success" => true,
        "message" => " ". $user->name . " with id # " . $user->id . " Updated Successfully!",
        "data" => $user
    ]);
}

    //Delete post
    public function DeleteUser($id){
        $user = new User();
        $user = User::find($id);
        if($user){
        $user->delete();
        return response()->json([
            "success" => true,
            "message" => "User Deleted Successfully!!",
            "data" => $user
        ]);
}
    else{
        return response()->json([
            "success" => true,
            "message" => "User not exist",
            "data" => $user
        ]);
    }
}

    //Searh User
    public function SearchUser($name)
    {
        return User::where('name','like','%'.$name.'%')->get();
    }

    //Fetch Single user data
    public function GetUser(Request $request,$id)
    {
        $request['id']=$id;
        $validator = Validator::make($request->all(),[ 
            'id' => 'exists:users,id',
            ]);
        if($validator->fails()) {          
            return response()->json(['error'=>$validator->errors()], 401);                        
        }
        $data=$validator->validated();
        $user_data=User::find($data['id']);
        return response()->json([
            "success" => true,
            "data" => $user_data
        ]);
    }

    //Fetch all users data
    public function GetAllUsers(Request $request)
    {
        $user_data=User::all();
        return response()->json([
            "success" => true,
            "data" => $user_data
        ]);
    }
}