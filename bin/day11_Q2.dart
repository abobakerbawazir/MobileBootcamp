import 'dart:ffi';
import 'dart:io';

class Student {
  late int _roll_no;
  late String _name;
  late bool? isActive = true;
  List<Course> course_Student = [];
  Student(this._roll_no, this._name, [this.isActive]) {
    isActive = true;
  }
  //Set Rool no
  set roll_no(int roll_no) {
    if (roll_no <= 0) {
      this._roll_no = roll_no * -1;
    } else
      this._roll_no = roll_no;
  }

//get Rool no
  int get roll_no {
    return _roll_no;
  }

  setcourse_Student(List<Course> course_Student) {
    this.course_Student = course_Student;
  }

  ShowStudentInfo_course() {
    print(
        "the Rool no of student is $_roll_no and Name is $_name and active of studen $isActive");
    //print("the student has email $email || password = $password");
    course_Student.forEach((element) {
      print(
          "number course = ${element._number} and name course ${element._nameCourse} and availabile of course ${element.isAvailable}");
    });
  }

///////////////
  addRppl_no_toStudent(int roll_no) {
    if (roll_no <= 0) {
      this._roll_no = roll_no * -1;
    } else
      this._roll_no = roll_no;
  }

  int getRppl_no_toStudent() => _roll_no;

///////////
// set Nmae
  set name(String name) {
    if (name.length >= 4) {
      this._name = name.toUpperCase();
    } else
      this._name = name.toLowerCase();
  }

//get Rool no
  String get name {
    return _name;
  }

  //////////////
  addname_toStudent(String name) {
    if (name.length >= 4) {
      this._name = name.toUpperCase();
    } else
      this._name = name.toLowerCase();
  }

  getname_toStudent() => _name;

  addcourse(Course courses) {
    if (course_Student.length < 4) {
      course_Student.add(courses);
    } else
      print("Error");
  }

  PrintInfocourse() {
    course_Student.forEach((element) {
      print(element._nameCourse);
    });
  }

  removecourse(int index) {
    course_Student.removeAt(index);
  }
}

class Course {
  late int _number;
  late String _nameCourse;
  late bool? isAvailable = true;
  Course(this._number, this._nameCourse, [this.isAvailable]) {
    isAvailable = true;
  }
  // set Nmae
  set IsAvailable(bool isAvailable) {
    this.isAvailable = isAvailable;
  }

//get Rool no
  // Bool get IsAvailable {
  //   return 
  // }
}
