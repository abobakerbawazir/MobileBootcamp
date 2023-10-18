import 'CorurseModel.dart';

class CouresController {
  List<Course> courseList = [];
  int selectedIndex = -1;

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

  void editTodoAtIndex(int index) {
    selectedIndex = index;
    //defiend varaible Todo=todos[index]
    Course course = courseList[index];
    // titleController.text = course.title;
    // descriptionController.text = todo.description;
  }

  void updateTodo() {
    if (selectedIndex != -1) {
      Course course = courseList[selectedIndex];
      
      // String newTitle = titleController.text;
      // String newDescription = descriptionController.text;

      // setState(() {
      //   Todo todo = todos[selectedIndex];
      //   todo.title = newTitle;
      //   todo.description = newDescription;

      //   titleController.clear();
      //   descriptionController.clear();
      //   selectedIndex = -1;
      // });
    }
  }
}
