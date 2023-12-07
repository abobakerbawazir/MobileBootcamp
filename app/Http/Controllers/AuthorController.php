<?php

namespace App\Http\Controllers;

use App\Models\Author;
use App\Models\Book;
use App\Trails\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AuthorController extends Controller
{
    use ApiResponse;
    /**
     * 
     * Display a listing of the resource.
     */
    public function indexAuthor(int $id_book, int $id_author)
    {
        $result = Book::find($id_book)->authors->find($id_author);
        return $this->success_ressponse(result: $result);
        //
    }
    // public function index()
    // {
    //     $result = Author::all();
    //     return $this->success_ressponse(result: $result);
    //     //
    // }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = $this->rules($request);
        if ($validation->fails()) {
            return $this->failed_ressponse(result: $validation->errors(), code: 404);
        }
        $result = Author::create($request->all());
        return $this->success_ressponse(result: $result, code: 201);
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {

        $result = Author::find($id);
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
        $obj = Author::find($id);
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
        $obj = Author::find($id);
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
            'name' => 'required|unique:authors',

        ]);
    }
}
