<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Http\Requests\SendFriendRequest;
use App\Http\Requests\UpdateFriendRequest;
use App\Mail\FriendRequestMail;
use App\Models\FriendRequest;
use App\Models\User;
use Illuminate\Support\Facades\Mail;

class FriendRequestController extends Controller
{
    //Create friend request
    public function SendFriendRequest(SendFriendRequest $request){
        $token = $request->bearerToken(); 
        try {
            $decoded_data=(new JwtController)->varifyToken($token);

            $data = $request->validated();
            $friendRequest = new FriendRequest();
            $friendRequest->sender = $decoded_data->data->id;
            $friendRequest->reciever = $data['id'];
            $friendRequest->save();
            $receiver_user = User::where('id', request('id'))->first();
            
            $data['receiver_user_name'] = $receiver_user->user_name;
            $data['sender_user_name'] = $decoded_data->data->user_name;
            $data['link']=url('api/GetAllFriendRequest/');
            
            Mail::to($receiver_user->email)->send(new FriendRequestMail($data));

            $response_data['data']=Null; 
            $response_data['message']='Request sent successfully!';
            return response()->success($response_data,200);
            
        }catch(\Exception $ex){
            $response_data['error']=$ex->getMessage();
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404);
        }
    }
    //update friend Request
    public function UpdateFriendRequest(UpdateFriendRequest $request){
        try {
            $data = $request->validated();
            $friendRequest =  FriendRequest::where('id', $data['id']);
            $friendRequest->status = $data['status'];
            $friendRequest->update($data);
            $response_data['data']=Null; 
            $response_data['message']='Request Updated successfully!';
            return response()->success($response_data,200);
        }catch (\Exception $ex) {
            $response_data['error']=$ex->getMessage();
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404);                  
        }
    }
    //Get All Friend Request
    public function GetAllFriendRequest(){
        $token=request()->bearerToken();   

        $decoded_data=(new JwtController)->varifyToken($token);
        $user_data = FriendRequest::where('reciever',$decoded->data->id)->first();
        if(!empty($user_data['id'])){

            $response_data['data']=$user_data; 
            $response_data['message']='All Friends Requests!!!';
            return response()->success($response_data,200);
        }
        else{
            $response_data['error']='There is No New friend Request';
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404); 
        }
    }


}