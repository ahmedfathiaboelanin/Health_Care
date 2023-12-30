<?php

namespace App\Http\Controllers;
use App\Models\Disease;
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
        $reqSymptoms = $request->symptoms;
        
        // call the AI Api
        $response = Http::post('http://127.0.0.1:5000/predict', [
            "symptoms"=>$reqSymptoms
        ]);

        // get the disease from the response
        $disease = json_decode($response)->voting_prediction;

        // get data from the database
        $diseaseData = Disease::where("name",$disease)->first();

        $responseData = ["ar_Disease" => $diseaseData->ar_name,
                "ar_Description" => $diseaseData->ar_description,
                "ar_Spcialist"=>$diseaseData->ar_specialist,
                "ar_Precautions"=>$diseaseData->ar_precuations,
                "Disease" => $diseaseData->name,
                "Description" => $diseaseData->description,
                "Spcialist"=>$diseaseData->specialist,
                "Precautions"=>$diseaseData->precuations
            ];
            // send the response to the front-end as json
            return response()->json(
                $responseData
            ) ;

        
    }
    public function all(){
        return Disease::all();
    }
}
