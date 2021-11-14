<?php

use App\Http\Controllers\API\ForgotPasswordController;
use App\Http\Controllers\API\userController;
use App\Http\Controllers\API\RegistrationController;
use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\PostController;
use App\Http\Controllers\API\CommentController;
use App\Http\Controllers\API\FriendRequestController;
use App\Http\Middleware\EmailVarified;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

    //REGISTER
    Route::post('register', [RegistrationController::class, 'register']);
    
    //MIDDLEWARE
    Route::middleware([EmailVarified::class])->group(function(){
    //LOGIN
    Route::post('login', [LoginController::class, 'login']);
    //FORGOT PASSWORD
    Route::get('/forgotPassword', [ForgotPasswordController::class, 'forgotPassword']);
    });

    //EMAIL VERIFY
    Route::get('emailConfirmation/{email}/{token}', [RegistrationController::class, 'verifyingEmail']);

    //MIDDLEWARE 
    Route::middleware([JwtAuth::class])->group(function(){

    //CRUD Users SECTION
    //Get specific user
    Route::get('GetUser/{id}', [UserController::class, 'GetUser']);
    //Get All user
    Route::get('GetUser', [UserController::class, 'GetAllUsers']);
    //Update
    Route::put('updateUser/{id}', [userController::class, 'UpdateUser']);
    //Delete 
    Route::delete('deleteUser/{id}', [userController::class, 'DeleteUser']);
    //Search User 
    Route::get('search/{name}', [userController::class, 'SearchUser']);

    //POSTS SECTION
    //Create Post
    Route::post('createPost', [PostController::class, 'upload']);
    //Get specific Post
    Route::get('GetPost/{id}', [PostController::class, 'GetPost']);
    //Get All Post
    Route::get('GetPost', [PostController::class, 'GetAllPosts']);
    //Delete Post
    Route::delete('delete/{id}', [PostController::class, 'DeletePost']);
    //Update Post
    Route::put('update', [PostController::class, 'UpdatePost']);

    //COMMENT SECTION
    //Creat Comment
    Route::post('comments', [CommentController::class, 'comment']);
    //Get specific Comment
    Route::get('ShowComment/{id}', [CommentController::class, 'GetComment']);
    //Get All Comments
    Route::get('GetAllComment', [CommentController::class, 'GetAllComment']);
    //Delete Comment
    Route::delete('DeleteComment/{id}', [CommentController::class, 'DeleteComment']);
    //Update Comment
    Route::put('updateComment', [CommentController::class, 'updateComment']);

    //FRIENDS SECTION
    //Send Friend Request
    Route::post('SendFriendRequest', [FriendRequestController::class, 'SendFriendRequest']);
    //update Frien d Request
    Route::put('updateFriendRequest', [FriendRequestController::class, 'UpdateFriendRequest']);
    //Delete Friend Request
    Route::delete('RemoveFriendRequest/{id}', [FriendRequestController::class, 'RemoveFriendRequest']);

    //LOGOUT
    Route::get('logout', [LoginController::class, 'logout']);
});



