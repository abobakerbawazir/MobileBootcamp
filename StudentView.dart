import 'Student.dart';
import 'StudentCon.dart';

class StudentView {
  StudentControler studentController = StudentControler();
  addStudent({required String name}) {
    print("Student addes sucessful");
    studentController.AddStudent(name: name);
  }

  showAllStudents() {
    studentController.showStudentsInfo();
  }

  deleteStudent({required int id}) {
    studentController.deleteStudent(id: id);
  }

  showOneTeacherInfo({required int id}) {
    studentController.showOneTeacherInfo(id: id);
  }
}
