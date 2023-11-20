// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/course.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

@Entity(tableName: 'RegCourse',primaryKeys: [
  'StudentId',
  'CourseId'
], foreignKeys: [
  ForeignKey(
      childColumns: ['StudentId'], parentColumns: ['id'], entity: Student),
      ForeignKey(
      childColumns: ['CourseId'], parentColumns: ['id'], entity: Course)
])
class RegCourse {
  final int? StudentId;
  final int? CourseId;
  RegCourse({
    this.StudentId,
    this.CourseId,
  });
}
