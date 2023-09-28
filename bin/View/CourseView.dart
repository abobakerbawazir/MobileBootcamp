import '../Contorller/CourseController.dart';

class CourseView {
  CourseController courseController = CourseController();

  showCourse() {
    courseController.Courses.forEach((element) {
      print(
          "Course name : ${element.name}. Marks : ${element.marks} ( Grade :${element.grade} )");
    });
  }

  newCourse({required String name, required int marks}) {
    
    courseController.addNewCourse(name: name, marks: marks);

    //print(showStudents());
  }
}
