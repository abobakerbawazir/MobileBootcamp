
import 'Course.dart';
import 'Grade.dart';
import 'Student.dart';
import 'StudentCon.dart';

class GrdeControler {
  static List<Grade> ListGrade = [];

  addGradeRecode({int? id, Corurse? c, double mark = 0.0}) {
    List<Student> Students = StudentControler.studenList;
    if (ListGrade.where((element) => element.course.name == c!.name).length ==
        3)
      print("coures reach mamimum");
    else {
      int index = Students.indexWhere((element) => element.id == id);
      if(index!=-1){
        ListGrade.add(Grade(course: c!,student: Students[index], mark: mark));
        print("add succcessfuly");
      }
      else{
        print("student not Exit");
      }
    }
  }

  updateMark({int? id , String? name,double mark=0.0}){
    int index = ListGrade.indexWhere((element) => (element.course.name==name)&& (element.student.id==id));
    ListGrade[index].mark=mark;
  }

}
