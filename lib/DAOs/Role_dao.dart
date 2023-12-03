import 'package:car_booking/Entitis/Role.dart';
import 'package:floor/floor.dart';

@dao
abstract class RoleDao {
  @Query('SELECT * FROM roles')
  Future<List<Role>> getAllRoles();
  @Query('SELECT * FROM roles WHERE id=:id')
  Future<Role?> getOneRole(int id);
  @insert
  Future<int> addRole(Role d);
  @insert
  Future<List<int>> addListRole(List<Role> d);
  @update
  Future<int> updatesRole(Role d);
  @update
  Future<int> updatesRoleList(List<Role> d);
  @Query('DELETE FROM roles WHERE id = :id')
  Future<int?> deleteRole(int id);
  @delete
  Future<int?> deleteRoleOfObject(Role d);
  // Future<int> deleteRoleList(List<Role> s);
  @Query('DELETE FROM roles')
  Future<int?> deletAlleRole();
  @Query('SELECT * FROM roles WHERE name LIKE :word')
  Future<List<Role>> searchByName(String word);
}
