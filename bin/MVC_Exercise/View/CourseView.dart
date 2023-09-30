import '../Contorller/CourseController.dart';

class CourseView {
  CourseController courseController = CourseController();

  showCourse() {
    courseController.Courses.forEach((element) {
      print(
          "Course name : ${element.name}. Marks : ${element.marks} ( Grade :${element.grade} ) ,Fess ${element.fees} ,${element.no_of_hours}");
    });
  }

  newCourse(String name, int marks, DateTime no_of_hours, double fees) {
    courseController.addNewCourse(
        name: name, marks: marks, no_of_hours: no_of_hours, fees: fees);

    //print(showStudents());
  }

  updateCourse(int index, int mark, String name, DateTime hours, double fees) {
    courseController.updateCourseInfo(
        index: index, mark: mark, name: name, hours: hours, fees: fees);

    //print(showStudents());
  }

  deletecourse(int index) {
    courseController.deleteCourse(index);
  }
}
