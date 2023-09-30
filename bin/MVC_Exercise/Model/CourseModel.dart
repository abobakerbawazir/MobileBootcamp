import '../Grade.dart';

class CourseModel {
  late String name;
  late int no_of_hours;
  late double fees;
  late Grade grade;
  late int marks;
  late List<String> teachers;
  late List<String> students;
  CourseModel() {
    teachers = [];
    students = [];

    //   CourseModel() {
    //  // grade = calculateGrade();
    // }
  }
  
  //   Grade calculateGrade() {
  //   if (marks >= 90) {
  //     return Grade.A;
  //   } else if (marks >= 80) {
  //     return Grade.B;
  //   } else if (marks >= 65) {
  //     return Grade.C;
  //   } else if (marks >= 50) {
  //     return Grade.D;
  //   } else {
  //     return Grade.F;
  //   }
  // }
}
  // set Name(String name) {
  //   this._name = name;
  // }

  // String get Name => this._name;

  // set Marks(int marks) {
  //   this._marks = marks;
  // }

  // int get Marks => this._marks;

