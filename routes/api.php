<?php

use App\Models\User;
use App\Models\Diseases;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\DiseasesController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("/diseases",[DiseasesController::class,"all"]);

Route::post("/diagnose",[DiseasesController::class,'diagnosis'] );









Route::post("/login",function (Request $request){

    $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);
    
    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    $user_name = $request->email;
    $password = $request->password;

    $user = User::where("user_name",$user_name)->first();
    
    if(!$user || !Hash::check($password,$user->password)){
        return response(
            ["Error"=>"Wrong email or password !!"]
        );
    }
    
    return response(
        $user
    );

});





Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [UserController::class, 'login']);
    Route::post('/register', [UserController::class, 'register']);
    Route::get('/profile', [UserController::class, 'userProfile']);
    Route::post('/logout', [UserController::class, 'logout']);
    Route::post('/refresh', [UserController::class, 'refresh']);
});





