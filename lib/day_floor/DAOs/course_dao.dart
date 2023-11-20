import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/course.dart';

@dao
abstract class CourseDao {
  @Query('SELECT * FROM Course')
  Future<List<Course>> getAllCourses();
  @Query('SELECT * FROM Course WHERE id=:id')
  Future<Course?> getOneCourse(int id);
  @insert
  Future<int> addCourse(Course d);
  @insert
  Future<List<int>> addListCourse(List<Course> d);
  @update
  Future<int> updatesCourse(Course d);
  @update
  Future<int> updatesCourseList(List<Course> d);
  @Query('DELETE FROM Course WHERE id = :id')
  Future<int?> deleteCourse(int id);
  @delete
  Future<int?> deleteCourse2(Course d);
  // Future<int> deleteCourseList(List<Course> s);
  @Query('DELETE FROM Course')
  Future<int?> deletAlleCourse();
  @Query('SELECT * FROM Course WHERE full_name LIKE :word')
  Future<List<Course>> searchByName(String word);
}
