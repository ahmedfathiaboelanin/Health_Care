<?php
namespace App\Http\Controllers;
use Validator;
use App\Models\User;
use App\Models\Doctor;
use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }
    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request){
        // validate requst data
    	$validator = Validator::make($request->all(), [
            'user_name' => 'required',
            'password' => 'required',
        ]);
        // if validation fails
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        // attempt login
        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        // return token
        return $this->createNewToken($token);
    }
    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'first_name'=>'required|string|between:2,100',
            'last_name'=>'required|string|between:2,100',
            'gender'=>'required|string|in:male,female',
            'email'=>'email|required',
            'user_name' => 'required|string|unique:users|between:2,100',
            'user_type' => 'required|string|in:patient,doctor,admin',
            'password' => 'required|string',
        ]);
        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }
        
        switch ($request->user_type) {
            case 'patient':
                $user = User::create(array_merge(
                    $validator->validated(),
                    ['password' => bcrypt($request->password)]
                ));
                $patient = new Patient;
                $patient->user_id =$user->id;
                $patient->save();
                return response()->json([
                    'message' => 'User successfully registered',
                    'user' => $user->user_type,
                    'patient'=>$patient
                ], 201);
                break;
            case 'doctor':
                if($request->doctor_personal_id && $request->specialization){
                    $user = User::create(array_merge(
                        $validator->validated(),
                        ['password' => bcrypt($request->password)]
                    ));
                    $doctor = new Doctor;
                    $doctor->user_id =$user->id;
                    $doctor->doctor_personal_id =$request->doctor_personal_id;
                    $doctor->specialization =$request->specialization;
                    $doctor->save();

                    return response()->json([
                        'message' => 'User successfully registered',
                        'user' => $user->user_type,
                        'doctor'=>$doctor
                    ], 201);
                }else{
                    return response()->json(["Error"=>"Missed Data"],400);
                }
                break;
        }
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout() {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }
    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }
    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile() {
        $user = auth()->user();
        return response()->json(["user"=>$user,"patient"=>$user->patient,"doctor"=>$user->doctor]);
    }
    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }
}