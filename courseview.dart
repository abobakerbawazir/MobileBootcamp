import 'CorurseCon.dart';
import 'Course.dart';

class CourseView {
  CorurseCon courseController = CorurseCon();
  // newCourse(String name, int marks, int noHouers, double fees) {
  //   courseController.addNewCorurse(name: name, noHouers: noHouers, fees: fees);

  //   //print(showStudents());
  // }

  displayAllcourses() {
    courseController.showCorurseInfo();
  }

  updateCourse(Corurse corurse, String name) {
    courseController.updateCorurse(corurse: corurse, name: name);
  }

  deleteCorurse({required String name}) {
    courseController.deleteCorurse(name: name);
  }
  showOneCorurseInfo({required String name}){
    courseController.deleteCorurse(name: name);
  }
}
