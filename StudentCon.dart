import 'dart:math';


import 'CorurseCon.dart';
import 'Course.dart';
import 'Student.dart';
import 'gradeControler.dart';

class StudentControler {
  static List<Student> studenList = [];
  bool AddStudent({required String name}) {
    studenList.add(Student(
        id: studenList.isEmpty ? 1 : studenList.last.id + 1, name: name));
    return true;
  }

  bool deleteStudent({required int id}) {
    if (studenList.any((element) => element.id == id)) {
      studenList.removeWhere((element) => element.id == id);
      return true;
    }
    return false;
  }

  updateStudent({required int id, required String name}) {
    int index = studenList.indexWhere((element) => element.id == id);
    if (index != -1)
      studenList[index].name = name;
    else
      "";
    // listStudent.forEach((element) {
    //   if (element.getId == id) element.name = name;
    // });
  }

  showOneTeacherInfo({required int id}) {
    int index = studenList.indexWhere((element) => element.id == id);
    if (index != -1)
      print(studenList[index].toString());
    else
      print("Not found");
  }

  showStudentsInfo() {
    studenList.forEach((sudent) {
      print(sudent.toString());
      double sum = 0.0;
      GrdeControler.ListGrade.where(
          (element) => element.student.id == sudent.id).forEach((ele) {
        sum += ele.course.fees;
        print(ele.toString());
      });
      if (sum != 0.0) print("Total : $sum");
    });
  }

  registercoures ({int? id ,String? name  }){
    Corurse ObjectCores = CorurseCon.listCorurse.firstWhere((element) => element.name == name ,orElse:()=> Corurse(fees: 0.0,name: "",noHouers: 0));
    if(ObjectCores.name !=""){
      GrdeControler().addGradeRecode(id:id,c:ObjectCores);
    }
  }
}
