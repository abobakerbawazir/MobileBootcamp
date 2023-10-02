import 'ExamModel.dart';
import 'Teacher.dart';

class Corurse {
  late String name;
  // late Teacher teacher;
  late int noHouers ;
  late double fees ;
  late int _id;
  late List<String> teachers;
  late List<String> students;
  late List<Exam> exams;
  // int available_Student=0;
  Corurse({required this.name,required this.noHouers,required this.fees});
  int get getId => this._id;

 set setId(int id) => this._id = id;

   String toString() => " Id: ${this._id}- course name : ${this.name} NoHouers : ${this.noHouers} Fees : ${this.fees} ";
}