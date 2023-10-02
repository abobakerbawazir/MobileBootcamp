import 'Teacher.dart';

class TeacherController {
  List<Teacher> teachers = [];

  void displayAllTeachers() {
    if (teachers.isEmpty) {
      print("No teachers found.");
      return;
    }

    for (Teacher teacher in teachers) {
      print("Teacher Name: ${teacher.name}");
      print("---------------------------");
    }
  }

  void displayTeacher(String teacherName) {
    Teacher teacher = findTeacher(teacherName);
    if (teacher != null) {
      print("Teacher Name: ${teacher.name}");
    } else {
      print("Teacher not found.");
    }
  }

  void addTeacher(String name) {
    Teacher teacher = Teacher(name:name);
    teachers.add(teacher);
    print("Teacher added successfully.");
  }

  void updateTeacher(Teacher teacherName, String newName) {
    Teacher teacher = findTeacher(teacherName.name);
    if (teacher != null) {
      teacher.name = newName;
      print("Teacher updated successfully.");
    } else {
      print("Teacher not found. Update failed.");
    }
  }

  void deleteTeacher(String teacherName) {
    Teacher teacher = findTeacher(teacherName);
    if (teacher != null) {
      teachers.remove(teacher);
      print("Teacher deleted successfully.");
    } else {
      print("Teacher not found. Deletion failed.");
    }
  }

  Teacher findTeacher(String teacherName) {
    return teachers.firstWhere((teacher) => teacher.name == teacherName,
        );
  }
}