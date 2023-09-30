import '../Model/TeacherModel.dart';

class TeacherController {
  late List<TeacherModel> teachers = [];
  TeacherModel teacherModel = TeacherModel();
  addNewTeache({required name}) {
    teacherModel.name = name;
    teachers.add(teacherModel);
  }
  DeleteTeache(int index) {
    if (index >= 0 && index <= teachers.length-1) {
      teachers.removeAt(index);
      print("Course deleted successfully.");
    } else {
      print("Invalid course index.");
    }
  }


  void displayTeacherInfo(int index) {
    if (index >= 0 && index < teachers.length) {
      teacherModel = teachers[index];
      print("Teacher Name: ${teacherModel.name}");
    } else {
      print("Invalid teacher index.");
    }
  }

  void displayAllTeachersInfo() {
    if (teachers.isEmpty) {
      print("No teachers available.");
    } else {
      for (int i = 0; i < teachers.length; i++) {
        displayTeacherInfo(i);
        print("--------------------");
      }
    }
  }
   updateTeacherInfo({
    required int index,
    required String name,
  }) {
    if (index <= teachers.length - 1) {
      teacherModel = teachers[index];
      teacherModel.name = name;
      print("Teacher info updated successfully.");
    } else {
      print("index of Teacher is invalid.");
    }
  }
}
