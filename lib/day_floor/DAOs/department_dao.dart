import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';

@dao
abstract class DepartmentDao {
  @Query('SELECT * FROM Department')
  Future<List<Department>> getAllDepartments();
  @Query('SELECT * FROM Department WHERE id=:id')
  Future<Department?> getOneDepartment(int id);
  @insert
  Future<int> addDepartment(Department d);
  @insert
  Future<List<int>> addListDepartment(List<Department> d);
  @update
  Future<int> updatesDepartment(Department d);
  @update
  Future<int> updatesDepartmentList(List<Department> d);
  @Query('DELETE FROM Department WHERE id = :id')
  Future<int?> deleteDepartment(int id);
  @delete
  Future<int?> deleteDepartment2(Department d);
  // Future<int> deleteDepartmentList(List<Department> s);
  @Query('DELETE FROM Department')
  Future<int?> deletAlleDepartment();
  @Query('SELECT * FROM Department WHERE full_name LIKE :word')
  Future<List<Department>> searchByName(String word);
}
