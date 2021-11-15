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
            $decoded_data=(new JwtController)->varifyToken($token);

            $request_data = $request->validated();
            $file_name = null;
            if (!empty($data['attachment'])) {    
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
            $save = new Comment();
            $save->attachment = $file_name;
            $save->text = $request_data['text'];
            $save->user_id = $decoded_data->data->id;
            $save->post_id =  $data['id'];
            $save->save();  
            
            //for generate link in URL
            $post = Post::where('id', $data['id'])->first();
            $post_user = User::with('Post')->where('id', $post->user_id)->first();
            
            $email_data['link']=url('api/GetPost/'.$data['id']);
            $email_data['name'] = $post_user->name;
            $email_data['text'] = $post->text;
            $email_data['email'] = $post_user->email;
            Mail::to($post_user['email'])->send(new CommentNotificationMail($email_data));
           
            //for JSON response
            $response_data['data']=null; 
            $response_data['message']='Commented!!';
            return response()->success($response_data,200);
        }
        catch (\Exception $e) {            
            $response_data['error']=$e->getMessage();
            $response_data['message']="Someting went Worng";
            return response()->error($response_data, 404); 
        }
    }
    //update Comments
    public function updateComment(UpdateCommentRequest $request){
        $reqeust_data = $request->validated();
        $Comment = Comment::find($reqeust_data['id']);
        if (!empty($reqeust_data['attachment'])) {
            // upload Attachment
            $destinationPath = storage_path('\app\public\comments\\'); 
            $input_type_aux = explode("/", $reqeust_data['attachment']['mime']);
            $attachment_extention=$input_type_aux[1];
            $image_base64 = base64_decode($reqeust_data['attachment']['data']);
            $file_name=uniqid() . '.'.$attachment_extention;
            $file = $destinationPath . $file_name;
            // saving in local storage
            file_put_contents($file, $image_base64);
            $Comment->attachment = $file_name;
        }
            //store your file into directory and db
            $Comment->text = $reqeust_data['text'];
            $Comment->save();  
            
            $response_data['data']=null; 
            $response_data['message']='Comment Updated Successfully!!';
            return response()->success($response_data,200);
    }
    //Delete Comment
    public function DeleteComment(DeleteCommentRequest $request){
        $request_data = $request->validated();
        
        $comment = Comment::find($request_data['id']);
        if($comment){
            $comment->delete();
            $response_data['data']=null; 
            $response_data['message']='Comment Delete Successfully!!';
            return response()->success($response_data,200);
        }
    }
}
