<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\RequestException;
use App\Models\Diseases;
use App\Models\Precautions;
use App\Models\Spcialist;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post("/diagnose",function(Request $request){

    // access request data
    $req = $request->symptoms;

    // call the AI Api
    $response = Http::post('http://127.0.0.1:5000/predict', [
        "symptoms"=>$req
    ]);
    
    // get the disease from the response
    $disease = json_decode($response)->lr_prediction;

    // get the description of the disease from the database
    $description = Diseases::where("Disease",$disease)->first()->Description;

    // get the Precaution
    $precautions = Precautions::select("precaution_1","precaution_2","precaution_3","precaution_4")->where("Disease",$disease)->first();

    // get the spcialist
    $spcialist = Spcialist::where("Disease",$disease)->first()->Specialist;

    // handel the response
    $data = ["Disease" => $disease, "Description" => $description, "Spcialist"=>$spcialist, "Precautions"=>[$precautions->precaution_1,$precautions->precaution_2,$precautions->precaution_3,$precautions->precaution_4]];

    // send the response to the front-end as json
    return response()->json(
        $data
    ) ;

});