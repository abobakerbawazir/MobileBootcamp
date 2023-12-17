<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Trails\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $result = User::all();
        return $this->success_ressponse(result: $result);
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = $this->rules($request);
        if ($validation->fails()) {
            return $this->failed_ressponse(result: $validation->errors(), code: 404);
        }
        $result = User::create($request->all());
        return $this->success_ressponse(result: $result, code: 201);
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $result = User::find($id);
        if (!is_null($result)) {
            return $this->success_ressponse(result: $result);
        } else {
            return $this->failed_ressponse(result: $result, code: 404);
        }
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, int $id)
    {
        $validation = $this->rules($request);
        if ($validation->fails()) {
            return $this->failed_ressponse(result: $validation->errors(), code: 404);
        }
        $obj = User::find($id);
        if (!is_null($obj)) {
            $result = tap($obj)->update($request->all());
            return $this->success_ressponse(result: $result);
        } else {
            return $this->failed_ressponse(code: 404);
        }
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(int $id)
    {
        $obj = User::find($id);
        if (!is_null($obj)) {
            $result = $obj->delete();
            if (!is_null($result)) {
                return $this->success_ressponse($result);
            }
        } else {
            return $this->failed_ressponse(message: "id is not found", code: 404);
        }
        //
    }
    public function rules(Request $request)
    {
        return Validator::make($request->all(), [
            'name' => 'required|unique:users',
            'email' => 'required|unique:users',
            'momaiaz_number' => 'required|unique:users',



        ]);
    }

    public function login(Request $request)
    {
        $logunUser = $request->validate(['email' => 'required|email', 'password' => 'required']);
        if (Auth::attempt($logunUser)) {
            $user = User::where('email', $logunUser['email'])->first();
            $token = $user->createToken('api token')->plainTextToken;

            return response()->json(["user"=>$user, 'token' => $token]);
        }
        return response()->json(['message' => 'invalid User Login', 401]);
    }

    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();
        return response()->json(['messgae' => 'Logged out successfully']);
    }
}
