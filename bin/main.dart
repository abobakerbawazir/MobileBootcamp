import 'day11_Q2.dart';

void main(List<String> args) {
  Student s = Student(123, "Ali");
  Student s1 = Student(124, "Ali sale");
  Student s2 = Student(125, "Ali omer naser");
  Course c = Course(12345, "IT");
  Course c1 = Course(12345, "IT");
  Course c2 = Course(12345, "IT");
  Course c3 = Course(12345, "CS");
  Course c4 = Course(12345, "IT");

  s.addcourse(c);
  s.addcourse(c1);
  s.addcourse(c2);
  s.addcourse(c3);
  s.removecourse(1);
  //s.addcourse(c4);
  //s.setcourse_Student([c4]);
  s.PrintInfocourse();
  s.ShowStudentInfo_course();
}
