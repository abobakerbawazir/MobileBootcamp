import '../Contorller/StudentController.dart';

class StudentView {
  
  StudentController studentController = StudentController();

  showStudents() {
    studentController.Students.forEach((element) {
      print("name : ${element.name}. id : ${element.id}");
    });
  }

  newProduct({required String name}) {
    print("Student addes sucessful");
    studentController.addNewStudent(name: name);
    

    //print(showStudents());
  }
}
