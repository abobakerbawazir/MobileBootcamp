import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/student.dart';

@dao
abstract class StudentDao {
  @Query('SELECT * FROM StudentX')
  Future<List<Student>> getAllStudents();
  @Query('SELECT * FROM StudentX WHERE id=:id')
  Future<Student?> getOneStudent(int id);
  @insert
  Future<int> addStudent(Student s);
  @insert
  Future<List<int>> addListStudent(List<Student> s);
  @update
  Future<int> updatesStudent(Student s);
  @update
  Future<int> updatesStudentList(List<Student> s);
  @Query('DELETE FROM StudentX WHERE id = :id')
  Future<int?> deleteStudent(int id);
  @delete
  Future<int?> deleteStudent2(Student s);
  // Future<int> deleteStudentList(List<Student> s);
  @Query('DELETE FROM StudentX')
  Future<int?> deletAlleStudent();
  @Query('SELECT * FROM StudentX WHERE full_name LIKE :word')
  Future<List<Student>> searchByName(String word);
}
