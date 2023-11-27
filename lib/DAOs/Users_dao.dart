import 'package:car_booking/Entitis/Users.dart';
import 'package:floor/floor.dart';
@dao
abstract class UserDao {
  @Query('SELECT * FROM users')
  Future<List<User>> getAllusers();
  @Query('SELECT * FROM users WHERE id=:id')
  Future<User?>getOneUser(int id);
  @insert
  Future<int> addUser(User u);
  @insert
  Future<List<int>> addListUser(List<User> u);
  @update
  Future<int> updatesUser(User d);
  @update
  Future<int> updatesUserList(List<User> u);
  @Query('DELETE FROM users WHERE id = :id')
  Future<int?> deleteUser(int id);
  @delete
  Future<int?> deleteUserOfObject(User u);
  // Future<int> deleteUserList(List<User> s);
  @Query('DELETE FROM users')
  Future<int?> deletAlleUser();
  @Query('SELECT * FROM users WHERE name LIKE :word')
  Future<List<User>> searchByName(String word);
}
