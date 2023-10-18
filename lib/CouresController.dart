import 'CorurseModel.dart';

class CouresController {
  List<Course> courseList = [];
  // TextEditingController nameController = TextEditingController();
  // TextEditingController hoursController = TextEditingController();

  void addCourse(String name, int hours) {
    // String name = nameController.text;
    // int hours = int.parse(hoursController.text);

    Course newCourse = Course(name: name, hours: hours);
    courseList.add(newCourse);
    
  }

  void deleteCourseAtIndex(int index) {
    courseList.removeAt(index);
  }
}