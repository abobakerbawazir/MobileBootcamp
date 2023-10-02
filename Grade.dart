import 'Course.dart';
import 'Student.dart';

class Grade {
  late Corurse course;
  late Student student;
  late double mark;
  late String _grade;

  Grade({required this.course,required Student student, required this.mark}) {
   
  }
  String get grade {

 if (mark <= 100 && mark > 89)
      _grade = "A";
    else if (mark <= 89 && mark > 79)
      _grade = "B";
    else if (mark <= 79 && mark > 69)
      _grade = "C";
    else if (mark <= 69 && mark > 59)
      _grade = "D";
    else
      _grade = "F";

      return grade;
  }
  String toString() => "${course.toString()} \n mark: $mark. ( Grade : $_grade)";
}