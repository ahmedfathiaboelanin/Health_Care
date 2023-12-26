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
        $reqSymptoms = $request->symptoms;
        $lang = $request->lang;
        
        // call the AI Api
        $response = Http::post('http://127.0.0.1:5000/predict', [
            "symptoms"=>$reqSymptoms
        ]);

        // get the disease from the response
        $disease = json_decode($response)->voting_prediction;

        // get data from the database
        $diseaseData = Diseases::where("Disease",$disease)->first();

        if($lang === "en"){
            // handel the response
            $responseData = ["Disease" => $diseaseData->Disease,
                "Description" => $diseaseData->Description,
                "Spcialist"=>$diseaseData->Specialist,
                "Precautions"=>[$diseaseData->precaution_1,$diseaseData->precaution_2,$diseaseData->precaution_3,$diseaseData->precaution_4]];
    
            // send the response to the front-end as json
            return response()->json(
                $responseData
            ) ;
        }else{
            // handel the response
            $responseData = ["ar_Disease" => $diseaseData->ar_Disease,
                "ar_Description" => $diseaseData->ar_Description,
                "ar_Spcialist"=>$diseaseData->ar_Specialist,
                "ar_Precautions"=>[$diseaseData->ar_precaution_1,$diseaseData->ar_precaution_2,$diseaseData->ar_precaution_3,$diseaseData->ar_precaution_4],
                "Disease" => $diseaseData->Disease,
                "Description" => $diseaseData->Description,
                "Spcialist"=>$diseaseData->Specialist,
                "Precautions"=>[$diseaseData->precaution_1,$diseaseData->precaution_2,$diseaseData->precaution_3,$diseaseData->precaution_4]
            ];
            // send the response to the front-end as json
            return response()->json(
                $responseData
            ) ;
        }
        
    }
    public function all(){
        return Diseases::all();
    }
}
