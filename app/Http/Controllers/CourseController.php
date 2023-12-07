<?php

namespace App\Http\Controllers;

use App\Models\Course;
use App\Models\Teacher;
use App\Trails\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CourseController extends Controller
{
    use ApiResponse;
    /**
     * Display a listing of the resource.
     */

    public function addCourses(Request $request)
    {
        $validation = $this->rules($request);
        if ($validation->fails()) {
            return $this->failed_ressponse(result: $validation->errors(), code: 404);
        }
        $courseData = $request->input('courses');
        foreach ($courseData as $courseData) {
            $course = new Course();
            $course->name = $courseData['name'];
            $course->hours = $courseData['hours'];
            $course->save();
        }
        return response()->json(['message' => 'Courses added Successfully']);
    }


    public function addCoursesToTeacher(Request $request)
    {
        $teacherData = $request->input('teacher');
        $courseData = $request->input('courses');
        $teacher = new Teacher();
        $teacher->name = $teacherData['name'];
        $teacher->save();
        foreach ($courseData as $courseData) {
            $course = new Course();
            $course->name=$courseData['name'];
            $course->teacher_id = $teacherData['id'];
            $course->save();
        }
        return response()->json(['message' => 'Courses and Teacher added Successfully']);
        // foreach ($courseData as $courseData) {
        //     $course = new Course();
        //     $course->id = $courseData['id'];
        //     $course->hours = $courseData['hours'];
        //     $course->save();
        // }
        // return response()->json(['message' => 'Courses added Successfully']);
    }

    public function index()
    {
        $result = Course::all();
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
        $result = Course::create($request->all());
        return $this->success_ressponse(result: $result, code: 201);
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(int $id)
    {
        $result = Course::find($id);
        if (!is_null($result)) {
            return $this->success_ressponse(result: $result);
        } else {
            return $this->failed_ressponse(message: "id is not found", code: 404);
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
        $obj = Course::find($id);
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
        $obj = Teacher::find($id);
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
            'name' => 'required|unique:courses',

        ]);
    }
}
