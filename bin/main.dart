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

  CourseView courseView1 = CourseView();
  CourseView courseView2 = CourseView();
  CourseView courseView3 = CourseView();
  print('');
  
  courseView1.newCourse(name: "C#", marks: 20);
  
  
  courseView2.newCourse(name: "Mobile App", marks: 95);
  courseView3.newCourse(name: "python", marks: 95);
  studentView.showStudents();
  courseView1.showCourse();
  studentView1.showStudents();
  courseView2.showCourse();
  studentView2.showStudents();
  courseView2.showCourse();

}
