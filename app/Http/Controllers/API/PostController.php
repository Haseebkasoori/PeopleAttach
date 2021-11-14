<?php

namespace App\Http\Controllers\API;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller; 
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use App\Models\Post;
use Illuminate\Http\Request;
use App\Http\Requests\PostRequest;
use App\Http\Requests\UpdatePostRequest;

class PostController extends Controller
{
    //file uploading
    public function upload(PostRequest $request) 
    { 
        $token = $request->bearerToken(); 
        try {
            $decoded_data=JWT::decode($token, new Key("sumaila", 'HS256'));
            $input = $request->validated();
            $file_name=null;  
            // converting base64 decoded image to simple image if exist
            if (!empty($input['attachment'])) {
                // upload Attachment
                $destinationPath = storage_path('\app\public\post\\'); 
                $input_type_aux = explode("/", $input['attachment']['mime']);
                $attachment_extention=$input_type_aux[1];
                $image_base64 = base64_decode($input['attachment']['data']);
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
                return response()->json([
                    "success" => true,
                    "message" => "Post successfully Created",
                ]);
                }
            
        catch (\Exception $e) {
        return response()->json(['error'=>$e->getMessage()], 500);                    
        }
    }

    //Get Single Post
    public function GetPost(Request $request,$id)
    {
        $request['id']=$id;
        $validator = Validator::make($request->all(),[ 
            'id' => 'exists:post,id',
            ]);
        if($validator->fails()) {          
            return response()->json(['error'=>$validator->errors()], 401);                        
        }
        $data=$validator->validated();
        $post_data=Post::with('Comments')->find($data['id']);
        return response()->json([
            "success" => true,
            "data" => $post_data
        ]);
    }
    //Fetch all Posts
    public function GetAllPosts(Request $request)
    {
        $user_data=Post::with('Comments')->get();
        return response()->json([
            "success" => true,
            "data" => $user_data
        ]);
    }
     //update Post data
     public function UpdatePost(UpdatePostRequest $request){
        $input = $request->validated();
        $data = Post::find($input['id']);
        if (!empty($input['attachment'])) {
            // upload Attachment
            $destinationPath = storage_path('\app\public\post\\'); 
            $input_type_aux = explode("/", $input['attachment']['mime']);
            $attachment_extention=$input_type_aux[1];
            $image_base64 = base64_decode($input['attachment']['data']);
            $file_name=uniqid() . '.'.$attachment_extention;
            $file = $destinationPath . $file_name;
            // saving in local storage
            file_put_contents($file, $image_base64);
            $data->attachment = $file_name;
        }
            //store your file into directory and db
            $data->text = request('text');
            $data->save();  
        return response()->json([
            "success" => true,
            "message" => "Post Updated Successfully!"
        ]);
    }
    
    //Delete post
    public function DeletePost($id){
        $user = new Post();
        $user = Post::find($id);
        if($user){
        $user->delete();
        return response()->json([
            "success" => true,
            "message" => "Post Deleted Successfully!!"
        ]);
    }
        else{
            return response()->json([
                "success" => true,
                "message" => "Post not exist"
            ]);
        }
    }
}
