<?php

namespace App\Http\Controllers;


use App\Models\Book;
use App\Trails\ApiResponse;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use LDAP\Result;

use function PHPUnit\Framework\isNull;

class BookController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $result = Book::all();
        return $this->success_ressponse(result: $result);
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
        $request["published_at"] = Carbon::createFromFormat('d/m/Y', $request->published_at);
        $result = Book::create($request->all());
        return $this->success_ressponse(result: $result, code: 201);

        //
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $result = Book::find($id);
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

        $obj = Book::find($id);
        if (!is_null($obj)) {
            if ($request->has("published_at")) {
                $request["published_at"] = Carbon::createFromFormat('d/m/Y', $request->published_at);
            }
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
        $obj = Book::find($id);
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
            'name' => 'required|unique:books',
            'published_at' => 'required|date_format:d/m/Y|before:' . Carbon::now()
        ]);
    }
}
