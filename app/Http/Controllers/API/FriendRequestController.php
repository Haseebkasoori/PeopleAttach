<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Http\Requests\SendFriendRequest;
use App\Http\Requests\UpdateFriendRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Models\FriendRequest;
use App\Models\User;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Illuminate\Http\Request;

class FriendRequestController extends Controller
{
    //Create friend request
    public function SendFriendRequest(SendFriendRequest $request){
        $token = $request->bearerToken(); 
        try {
            $decoded_data=JWT::decode($token, new Key("sumaila", 'HS256'));
            $data = $request->validated();
            $friendRequest = new FriendRequest();
            $friendRequest->sender = $decoded_data->data->id;
            $friendRequest->reciever = $data['id'];
            $friendRequest->save();
            return response()->json(['success'=>'Request sent successfully!'], 200);  
        }
        catch (\Exception $e) {
            return response()->json(['error'=>$e->getMessage()], 500);                    
            }
    }
    //update friend Request
    public function UpdateFriendRequest(UpdateFriendRequest $request){
        try {
            $data = $request->validated();
            $friendRequest =  FriendRequest::where('id', $data['id']);
            $friendRequest->status = $data['status'];
            $friendRequest->update($data);
            return response()->json(['success'=>'Request Updated successfully!'], 200);  
        }
        catch (\Exception $e) {
            return response()->json(['error'=>$e->getMessage()], 500);                    
            }
    }
    //Remove Friend Request
    public function RemoveFriendRequest($id){
        $user = new FriendRequest();
        $user = FriendRequest::find($id);
        if($user){
        $user->delete();
        return response()->json([
            "success" => true,
            "message" => "Request Remove Successfully!!"
        ]);
    }
        else{
            return response()->json([
                "success" => true,
                "message" => "Request no longer exist"
            ]);
        }
    }
}
