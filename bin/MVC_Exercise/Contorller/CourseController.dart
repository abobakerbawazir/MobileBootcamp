import '../Grade.dart';
import '../Model/CourseModel.dart';

class CourseController {
  late Grade grade;
  late List<CourseModel> Courses = [];
  CourseModel courseModel = CourseModel();

  addNewCourse(
      {required name, required marks, required no_of_hours, required fees}) {
    if (name.length <= 4) {
      courseModel.name = name;
      courseModel.no_of_hours = no_of_hours;
      courseModel.marks = marks;
      courseModel.fees = fees;
      if (marks >= 90) {
        courseModel.grade = Grade.A;
      } else if (marks >= 80) {
        courseModel.grade = Grade.B;
      } else if (marks >= 65) {
        courseModel.grade = Grade.C;
      } else if (marks >= 50) {
        courseModel.grade = Grade.D;
      } else {
        courseModel.grade = Grade.F;
      }

      Courses.add(courseModel);
    } else {
      print("Can not length name of course>=4");
    }
  }

  updateCourseInfo(
      {required int index,
      required int mark,
      required String name,
      required int hours,
      required double fees}) {
    if (index >= 0 && index < Courses.length) {
      if (name.length <= 4) {
        courseModel = Courses[index];
        courseModel.name = name;
        courseModel.no_of_hours = hours;
        courseModel.marks = mark;
        courseModel.fees = fees;
        if (mark >= 90) {
          courseModel.grade = Grade.A;
        } else if (mark >= 80) {
          courseModel.grade = Grade.B;
        } else if (mark >= 65) {
          courseModel.grade = Grade.C;
        } else if (mark >= 50) {
          courseModel.grade = Grade.D;
        } else {
          courseModel.grade = Grade.F;
        }
        print("Course info updated successfully.");
      } else {
        print("Course name must be 4 characters long.");
      }
    } else {
      print("Invalid course index.");
    }
  }

  void deleteCourse(int index) {
    if (index >= 0 && index < Courses.length) {
      Courses.removeAt(index);
      print("Course deleted successfully.");
    } else {
      print("Invalid course index.");
    }
  }

  void displayAllcourses() {
    if (Courses.isEmpty) {
      print("no course found");
      return;
    }
    else{
      for(CourseModel course in Courses){
         print("Course Name: ${course.name}");
      print("Hours: ${course.no_of_hours}");
      print("Fees: ${course.fees}");
      print("Teachers: ${course.teachers.join(", ")}");
      print("Students: ${course.students.join(", ")}");
      print("---------------------------");
      }
    }
  }

  CourseModel findCourse(String courseName) {
    return Courses.firstWhere((course) => course.name == courseName);
  }
    void displayCourse(String courseName) {
    CourseModel course = findCourse(courseName);
    if (course != null) {
      print("Course Name: ${course.name}");
      print("Hours: ${course.no_of_hours}");
      print("Fees: ${course.fees}");
      print("Teachers: ${course.teachers.join(", ")}");
      print("Students: ${course.students.join(", ")}");
    } else {
      print("Course not found.");
    }
  }
}
