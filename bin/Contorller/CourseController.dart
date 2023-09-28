import '../Grade.dart';
import '../Model/CourseModel.dart';
import '../Model/StudentModel.dart';

class CourseController extends StudentModel {
  late Grade grade;
  late List<CourseModel> Courses = [];
  CourseModel courseModel = CourseModel();

  

  addNewCourse({required name, required marks}) {
    courseModel.name = name;
    courseModel.marks = marks;
    if (marks >= 90) {
      courseModel.grade= Grade.A;
    } else if (marks >= 80) {
      courseModel.grade= Grade.B;
    } else if (marks >= 65) {
      courseModel.grade= Grade.C;
    } else if (marks >= 50) {
      courseModel.grade= Grade.D;
    } else {
      courseModel.grade= Grade.F;
    }

    Courses.add(courseModel);
  }
}
