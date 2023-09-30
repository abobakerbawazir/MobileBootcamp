import '../Model/CourseModel.dart';
import '../Model/StudentModel.dart';

class StudentController {
  
  late List<StudentModel> _Students = [];
  StudentModel studentModel = StudentModel();
  CourseModel courseModel = CourseModel();

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

  void displaystudentInfo(int index) {
    if (index >= 0 && index < Students.length) {
      studentModel = Students[index];
      print(
          "Student Id : ${studentModel.id}  ,Student Name: ${studentModel.name}");
    } else {
      print("Invalid Student index.");
    }
  }

  void displayAllStudentsInfo() {
    if (Students.isEmpty) {
      print("No teachers available.");
    } else {
      for (int i = 0; i < Students.length; i++) {
        displaystudentInfo(i);
        print("--------------------");
      }
    }
  }

  void displayAllStudentsWithTotalFees(courses) {
    if (courses.isEmpty) {
      print("No courses available.");
    } else {
      for (CourseModel course in courses) {
        print("Course Name: ${course.name}");
        print("Total Students: ${course.name.length}");
        double totalFees = course.fees * course.name.length;
        print("Total Fees: $totalFees");
        print("--------------------");
      }
    }
  }
  // studentsdisplayAllStudentsWithTotalFees(){
  // double totalFees = 0;

  //   for (StudentModel student in Students) {
  //     print("Student Name: ${student.name}");
  //     print("Fees Paid: ${student.feespaid}");
  //     totalFees += student.feespaid;
  //     print("---------------------------");
  //   }

  //   print("Total Fees Collected: $totalFees");
  // }
}
