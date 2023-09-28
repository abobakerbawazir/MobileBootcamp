import 'View/CourseView.dart';
import 'View/StudentView.dart';

void main(List<String> args) {
  StudentView studentView = StudentView();
  StudentView studentView1 = StudentView();
  StudentView studentView2 = StudentView();
  studentView.newProduct(name: "Ali");
  studentView1.newProduct(name: "Ahmed");
  studentView2.newProduct(name: "Abobaker");

  studentView.showStudents();
  studentView1.showStudents();
  studentView2.showStudents();

  CourseView courseView = CourseView();
  courseView.newCourse(name: "C#", marks: 20);
  courseView.showCourse();
}
