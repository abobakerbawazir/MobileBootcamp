<?php

namespace App\Http\Controllers;

use App\Models\Student;
use App\Trails\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StudentController extends Controller
{
    use ApiResponse;
    public function addStudents(Request $request)
    {
        //$validation = $this->rules($request);
        
        $studentData = $request->input('students');
        foreach ($studentData as $studentData) {
            $student = new Student();
            $student->name = $studentData['name'];
            $student->email = $studentData['email'];
            $student->save();
        }
        return response()->json(['message' => 'Student added Successfully']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Student $student)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Student $student)
    {
        //
    }
    public function rules(Request $request)
    {
        return Validator::make($request->all(), [
            'name' => 'required|unique:students',

        ]);
    }
}
