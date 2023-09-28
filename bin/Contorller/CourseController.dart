import '../Model/CourseModel.dart';
import '../Model/StudentModel.dart';

class CourseController extends StudentModel {
  late List<CourseModel> _courses = [];
  CourseModel courseModel = CourseModel();

  List<CourseModel> get Courses => this._courses;

  addNewCourse({required name, required marks}) {
    
    if (marks < 50) {
      courseModel.grade = "F";
      courseModel.name = name;
    courseModel.marks = marks;
    
    Courses.add(courseModel);
      
    }
    
  }
}
