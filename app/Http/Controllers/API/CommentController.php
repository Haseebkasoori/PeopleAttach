<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\Controller;
use App\Http\Requests\CommentRequest;
use Illuminate\Http\Request;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Illuminate\Support\Facades\Validator;
use App\Models\Comment;
use App\Http\Requests\UpdateCommentRequest;
use App\Mail\CommentNotificationMail;
use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\Mail;

class CommentController extends Controller
{
    public function comment(CommentRequest $request) 
    {    
        $token = $request->bearerToken();
        try {
        $decoded_data=JWT::decode($token, new Key("sumaila", 'HS256'));
        $input = $request->validated();
        $file_name = null;
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
            $save = new Comment();
            $save->attachment = $file_name;
            $save->text = request('text');
            $save->user_id = $decoded_data->data->id;
            $save->post_id =  request('id');
            $save->save();  
            //for generate link in URL
            $post = Post::where('id', request('id'))->first();
            $post_user = User::with('Post')->where('id', $post->user_id)->first();
            $data['link']=url('api/GetPost/'.request('id'));
            $data['name'] = $post_user->name;
            $data['text'] = $post->text;
            $data['email'] = $post_user->email;
            Mail::to($data['email'])->send(new CommentNotificationMail($data));
            //for JSON response
            return response()->json([
                "success" => true,
                "message" => "Commented!",
                "file" => Null
            ]);
        }
        catch (\Exception $e) {            
            return response()->json(['error'=>$e->getMessage()], 500);                    
        }
    }
    //update Comments
    public function updateComment(UpdateCommentRequest $request){
        $input = $request->validated();
        $data = Comment::find($input['id']);
        if (!empty($input['attachment'])) {
            // upload Attachment
            $destinationPath = storage_path('\app\public\comments\\'); 
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
            "message" => "Comment Updated Successfully!"
        ]);
    }
        //Delete Comment
        public function DeleteComment($id){
            $user = new Comment();
            $user = Comment::find($id);
            if($user){
            $user->delete();
            return response()->json([
                "success" => true,
                "message" => "Comment Deleted Successfully!!",
            ]);
    }
        else{
            return response()->json([
                "success" => true,
                "message" => "Comment deost not exist",
                "data" => $user
            ]);
        }
    }
        //Fetch Single Comment
        public function GetComment(Request $request,$id)
        {
            $request['id']=$id;
            $validator = Validator::make($request->all(),[ 
                'id' => 'exists:Comments,id',
                ]);
            if($validator->fails()) {          
                return response()->json(['error'=>$validator->errors()], 401);                        
            }
            $data=$validator->validated();
            $user_data=Comment::find($data['id']);
            return response()->json([
                "success" => true,
                "data" => $user_data
            ]);
        } 
        //Fetch all Comments
        public function GetAllComment(Request $request)
        {
            $user_data=Comment::all();
            return response()->json([
                "success" => true,
                "data" => $user_data
            ]);
        }
}
