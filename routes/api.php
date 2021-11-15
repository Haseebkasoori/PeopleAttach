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
    Route::get('GetUser', [UserController::class, 'GetUser']);
    //Get All user
    Route::get('GetAllUsers', [UserController::class, 'GetAllUsers']);
    //Update
    Route::put('updateUser', [userController::class, 'UpdateUser']);
    //Delete 
    Route::delete('deleteUser', [userController::class, 'DeleteUser']);
    //Search User 
    Route::get('search', [userController::class, 'SearchUser']);

    //POSTS SECTION
    //Create Post
    Route::post('CreatePost', [PostController::class, 'CreatePost']);
    //Get specific Post
    Route::get('GetPost', [PostController::class, 'GetPost']);
    //Get All Post
    Route::get('GetAllPosts', [PostController::class, 'GetAllPosts']);
    //Delete Post
    Route::delete('DeletePost', [PostController::class, 'DeletePost']);
    //Update Post
    Route::put('UpdatePost', [PostController::class, 'UpdatePost']);

    //COMMENTS SECTION
    //Creat Comment
    Route::post('comments', [CommentController::class, 'comment']);
    //Delete Comment
    Route::delete('DeleteComment', [CommentController::class, 'DeleteComment']);
    //Update Comment
    Route::put('updateComment', [CommentController::class, 'updateComment']);
        
    Route::post('CreatePost', [PostController::class, 'CreatePost']);
    //Get specific Post
    Route::get('GetPost', [PostController::class, 'GetPost']);
    //Get All Post
    Route::get('GetAllPost', [PostController::class, 'GetAllPosts']);
    //Delete Post
    Route::delete('deletepost', [PostController::class, 'DeletePost']);
    //Update Post
    Route::put('updatePost', [PostController::class, 'UpdatePost']);


    //FRIENDS SECTION
    //Send Friend Request
    Route::post('SendFriendRequest', [FriendRequestController::class, 'SendFriendRequest']);
    //update Frien d Request
    Route::put('updateFriendRequest', [FriendRequestController::class, 'UpdateFriendRequest']);
    //Get Friend Request
    Route::get('GetAllFriendRequest', [FriendRequestController::class, 'GetAllFriendRequest']);

    //LOGOUT
    Route::get('logout', [LoginController::class, 'logout']);
});



