import '../Contorller/TeacherController.dart';

class TeacherView {
  TeacherController teacherController = TeacherController();
  showAllTeacher() {
    teacherController.displayAllTeachersInfo();
  }

  showoneTeacher(int index) {
    teacherController.displayTeacherInfo(index);
  }

  addTeacher(String name) {
     print("Teacher addes sucessful");
    teacherController.addNewTeache(name: name);
  }
  deleteTeacher(int index) {
    teacherController.DeleteTeache(index);
  }
  updateTeacher(int index, String name) {
    teacherController.updateTeacherInfo(
        index: index, name: name);

    //print(showStudents());
  }
}
