import '../Model/CourseModel.dart';
import '../Model/StudentModel.dart';

class CourseController extends StudentModel {
  late List<CourseModel> _courses = [];
  CourseModel courseModel = CourseModel();

  List<CourseModel> get Courses => this._courses;

  addNewCourse({required name, required marks}) {
    
    if (marks == 20) {
      courseModel.grade = "A";
      courseModel.name = name;
    courseModel.marks = marks;
    
    Courses.add(courseModel);
      
    }
    
  }
}
