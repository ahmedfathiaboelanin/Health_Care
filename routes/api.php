<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DiseasesController;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("/diagnose",[DiseasesController::class,'diagnosis'] ) ;