import 'Course.dart';
import 'Department.dart';

class Teacher {
  late Department department;
  late double salary;
  late int _id;
  late String name;
  List<Corurse> listTeacherCourse = [];

  Teacher({required this.name});

  int get getId => this._id;

  set setId(int id) => this._id = id;

  String toString() => " Id: ${this._id}- name : ${this.name} ";
}
