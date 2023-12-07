<?php

use App\Http\Controllers\CourseController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TeacherController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::post('addTeachers', [TeacherController::class, "addTeachers"]);
Route::post('addStudents', [StudentController::class, "addStudents"]);
Route::post('addCourses', [CourseController::class, "addCourses"]);
Route::post('addCoursesToTeacher', [CourseController::class, "addCoursesToTeacher"]);
Route::apiResources([
    //'indexAuthor'=>[AuthorController::class,'indexAuthor'],
    'teachers' => TeacherController::class,
    'courses'=>CourseController::class

]);
