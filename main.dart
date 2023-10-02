import 'CorurseCon.dart';
import 'StudentCon.dart';
import 'StudentView.dart';
import 'courseview.dart';

void main(List<String> args) {
  CorurseCon corurseCon = CorurseCon();
  corurseCon.addNewCorurse(name: "IT_support", noHouers: 12, fees: 30.0);
  CourseView courseView = CourseView();
  courseView.displayAllcourses();
  StudentControler studentController = StudentControler();
  studentController.AddStudent(name: "Ali");
  StudentView studentView = StudentView();
  studentView.showAllStudents();
}
