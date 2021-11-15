<?php

namespace App\Http\Controllers\API;

use Illuminate\Support\Facades\Validator;
use App\Http\Requests\GetAllPostsRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Http\Requests\DeletePostRequest;
use App\Http\Requests\GetPostRequest;
use App\Http\Controllers\Controller; 
use App\Http\Requests\PostRequest;
use App\Models\FriendRequest;
use Illuminate\Http\Request;
use App\Models\Post;


class PostController extends Controller
{
    //file uploading
    public function CreatePost(PostRequest $request) 
    { 
        $token = $request->bearerToken(); 
        try {
            $decoded_data=(new JwtController)->varifyToken($token);
            $request_data = $request->validated();
            $file_name=null;  
            // converting base64 decoded image to simple image if exist
            if (!empty($request_data['attachment'])) {
                // upload Attachment
                $destinationPath = storage_path('\app\public\post\\'); 
                $input_type_aux = explode("/", $request_data['attachment']['mime']);
                $attachment_extention=$input_type_aux[1];
                $image_base64 = base64_decode($request_data['attachment']['data']);
                $file_name=uniqid() . '.'.$attachment_extention;
                $file = $destinationPath . $file_name;
                // saving in local storage
                file_put_contents($file, $image_base64);
            }
            //store your file into directory and db
            $post = new Post();
            $post->attachment = $file_name;
            $post->text = request('text');
            $post->user_id = $decoded_data->data->id;
            $post->visibility = request('visibility');
            $post->save();  

            $response_data['data']=Null; 
            $response_data['message']='Post successfully Created';
            return response()->success($response_data,200);
            
        }catch(\Exception $ex){
            $response_data['error']=$ex->getMessage();
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404);
        }
    }
    
    //Get Single Post
    public function GetPost(GetPostRequest $request)
    {
        $token=request()->bearerToken();       
        
        $request_data=$validator->validated();      
        $decoded_data=(new JwtController)->varifyToken($token);
        
        $post_data=Post::with('User','Comments')->find($request_data['id']);
        $friend_request = DB::select(DB::raw(   
                                                "select * from friend_request 
                                                where (reciever='{$decoded_data->data->id}'AND sender='{$post_data->user_id}')
                                                OR (sender='{$decoded_data->data->id}'AND reciever='{$post_data->user_id}') 
                                                AND status='Approved'"
                                            ));
        
        //check status
        if(!empty($friend_request[0]->id) ){
            $response_data['data']=$post_data; 
            $response_data['message']='Post successfully Created';
            return response()->success($response_data,200);
        }else{
            $response_data['error']='Sorry,All posts are friends only!!';
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404);     
        }
        
    }
    //Fetch all Posts
    public function GetAllPosts(GetAllPostsRequest $request)
    {
        $token=request()->bearerToken();       
        
        $request_data=$validator->validated();      
        $decoded_data=(new JwtController)->varifyToken($token);
        
        $post_data=Post::with('User','Comments')->find($request_data['id']);
        $friend_request = DB::select(DB::raw(   
                                                "select * from friend_request 
                                                where (reciever='{$decoded_data->data->id}'AND sender='{$post_data->user_id}')
                                                OR (sender='{$decoded_data->data->id}'AND reciever='{$post_data->user_id}') 
                                                AND status='Approved'"
                                            ));
        
        //check status
        if(!empty($friend_request[0]->id) ){
            $response_data['data']=$post_data; 
            $response_data['message']='Post successfully Created';
            return response()->success($response_data,200);
        }else{
            $response_data['error']='Sorry,All posts are friends only!!';
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404);     
        }
    }
     //update Post data
     public function UpdatePost(UpdatePostRequest $request){
        $request_data = $request->validated();
        $post = Post::find($request_data['id']);
        if (!empty($request_data['attachment'])) {
            // upload Attachment
            $destinationPath = storage_path('\app\public\post\\'); 
            $file_type_aux = explode("/", $request_data['attachment']['mime']);
            $attachment_extention=$file_type_aux[1];
            $image_base64 = base64_decode($request_data['attachment']['data']);
            $file_name=uniqid() . '.'.$attachment_extention;
            $file = $destinationPath . $file_name;
            // saving in local storage
            file_put_contents($file, $image_base64);
            $post->attachment = $file_name;
        }
    
        //store your file into directory and db
        $post->text = request('text');
        $post->save();  
    
        $response_data['data']=Null; 
        $response_data['message']='Post Updated Successfully!!';
        return response()->success($response_data,200);
    }
    
    //Delete post
    public function DeletePost(DeletePostRequest $request ){
        $request_data=$validator->validated();
        $user = new Post();
        $user = Post::find($request_data['id']);
        if($user){
            $user->delete();
            
            $response_data['data']=Null; 
            $response_data['message']='Post Deleted Successfully!!';
            return response()->success($response_data,200);

        }else{
            $response_data['error']='Post not exist!!';
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404); 

        }
    }
}