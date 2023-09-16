// Q 3Write class called 'Student' with properties like 'name', 'age', and ‘major’. Implement a
//method to display student information.
//Q4 4) Create list of multiple students. Then filter them based on major taken from user

import 'dart:io';

class Student {
  late String name;
  late int age;
  late String major;
  Student(String n, int a, String m) {
    name = n;
    age = a;
    major = m;
  }
  showStudentInfo() {
    print("the information of Student ");
    print("name : $name");
    print("age : $age");
    print("major : $major");
  }
}

void main(List<String> args) {
  Student s = Student("Abobaker", 23, "IT");
  //example show Student Info of student
  s.showStudentInfo();

  Student s1 = Student("Ali", 24, "CS");
  Student s2 = Student("Ahmed", 25, "OS");
  Student s3 = Student("Abbas", 26, "IT");

  List<Student> students = [];
  students.add(s);
  students.add(s1);
  students.add(s2);
  students.add(s3);

  stdout.write('Enter the majer for filtter,s : ');
  String input_filter_major = stdin.readLineSync()!.toUpperCase();
  print('');
  for (var X in students) {
    if (X.major == input_filter_major) {
      X.showStudentInfo();
      print('');
    }
  }
}
