import '../Model/StudentModel.dart';

class StudentController {
  late List<StudentModel> _Students = [];
  StudentModel studentModel = StudentModel();
  // StudentModel studentMode2 = StudentModel();
  // StudentModel studentMode3 = StudentModel();
  List<StudentModel> get Students => this._Students;

  addNewStudent({required name}) {
    // int count = 1;
    // int s = count;
    // s += count;
    studentModel.id = studentModel.id;
    //studentModel.id++;
    studentModel.name = name;
    Students.add(studentModel);
    // studentMode2.id = 2;
    // studentMode2.name;
    //name;
    // Students.add(studentMode2);
    //return studentModel;
  }
}
