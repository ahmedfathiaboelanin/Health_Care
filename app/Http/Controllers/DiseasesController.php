<?php

namespace App\Http\Controllers;
use App\Models\Diseases;
use App\Http\Requests\StoreDiseasesRequest;
use App\Http\Requests\UpdateDiseasesRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\RequestException;


class DiseasesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function diagnosis(Request $request)
    {
        // access request data
        $req = $request->symptoms;
        
        // call the AI Api
        $response = Http::post('http://127.0.0.1:5000/predict', [
            "symptoms"=>$req
        ]);

        // get the disease from the response
        $disease = json_decode($response)->lr_prediction;

        // get data from the database
        $data = Diseases::where("Disease",$disease)->first();

        // handel the response
        $responseData = ["Disease" => $data->Disease, "Description" => $data->Description, "Spcialist"=>$data->Specialist, "Precautions"=>[$data->precaution_1,$data->precaution_2,$data->precaution_3,$data->precaution_4]];

        // send the response to the front-end as json
        return response()->json(
            $responseData
        ) ;
    }
}
