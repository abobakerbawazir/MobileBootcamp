import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/RegStudent.dart';

@dao
abstract class RegCourseDao {
  @Query('SELECT * FROM RegCourse')
  Future<List<RegCourse>> getAllRegCourses();
  @Query('SELECT * FROM RegCourse WHERE id=:id')
  Future<RegCourse?> getOneRegCourse(int id);
  @insert
  Future<int> addRegCourse(RegCourse d);
  @insert
  Future<List<int>> addListRegCourse(List<RegCourse> d);
  @update
  Future<int> updatesRegCourse(RegCourse d);
  @update
  Future<int> updatesRegCourseList(List<RegCourse> d);
  @Query('DELETE FROM RegCourse WHERE id = :id')
  Future<int?> deleteRegCourse(int id);
  @delete
  Future<int?> deleteRegCourse2(RegCourse d);
  // Future<int> deleteRegCourseList(List<RegCourse> s);
  @Query('DELETE FROM RegCourse')
  Future<int?> deletAlleRegCourse();
  @Query('SELECT * FROM RegCourse WHERE full_name LIKE :word')
  Future<List<RegCourse>> searchByName(String word);
}
