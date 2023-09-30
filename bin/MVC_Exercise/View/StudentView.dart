import '../Contorller/CourseController.dart';
import '../Contorller/StudentController.dart';
import '../Model/CourseModel.dart';

class StudentView {
  StudentController studentController = StudentController();
  CourseController courseController = CourseController();

  // showStudents() {
  //   studentController.Students.forEach((element) {
  //     print("name : ${element.name}. id : ${element.id}");
  //   });
  // }
  showAllStudents() {
    studentController.displayAllStudentsInfo();
  }

  showoneStudent(int index) {
    studentController.displaystudentInfo(index);
  }

  addStudent({required String name}) {
    print("Student addes sucessful");
    studentController.addNewStudent(name: name);

    //print(showStudents());
  }

  displayAllStudentsWithTotalFeesandView() {
    studentController.displayAllStudentsWithTotalFees(courseController.Courses);
  }

  // studentsdisplayAllStudentsWithTotalFeesView() {
  //   studentController.studentsdisplayAllStudentsWithTotalFees();
  // }
}
