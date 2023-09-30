import 'View/CourseView.dart';
import 'View/StudentView.dart';
import 'View/TeacherView.dart';

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

  CourseView courseView1 = CourseView();
  CourseView courseView2 = CourseView();
  CourseView courseView3 = CourseView();
  print('');

  courseView1.newCourse("IT", 30, DateTime.now(), 45.5);
  courseView1.updateCourse(0, 60, "asdd", DateTime.now(), 45.8);
  TeacherView teacherView = TeacherView();
  teacherView.addTeacher("Abbas");
  teacherView.showAllTeacher();
  //courseView1.deletecourse(0);

  // courseView2.newCourse(name: "Mobile App", marks: 95);
  // courseView3.newCourse(name: "python", marks: 95);
  studentView.showStudents();
  courseView1.showCourse();
  studentView1.showStudents();
  courseView2.showCourse();
  studentView2.showStudents();
  courseView2.showCourse();
}
