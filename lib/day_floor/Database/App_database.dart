import 'dart:async';
import 'package:flutter_application_2/day_floor/DAOs/RegStudent_dao.dart';
import 'package:flutter_application_2/day_floor/DAOs/course_dao.dart';
import 'package:flutter_application_2/day_floor/Entites/RegStudent.dart';
import 'package:flutter_application_2/day_floor/Entites/course.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/DAOs/department_dao.dart';
import 'package:flutter_application_2/day_floor/DAOs/student_dao.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';
part 'App_database.g.dart';

@Database(version: 1, entities: [Student, Department,Course,RegCourse])
abstract class AppDatabase extends FloorDatabase {
  RegCourseDao get regCourseDao;
  CourseDao get courseDao;
  StudentDao get studentDao;
  DepartmentDao get departmentDao;
}
