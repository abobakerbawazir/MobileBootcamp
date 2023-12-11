import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/Entites/TaskUser.dart';

@dao
abstract class TaskUserDao {
  @Query('SELECT * FROM TaskUser')
  Future<List<TaskUser>> getAllTaskUsers();
  @Query('SELECT * FROM TaskUser WHERE UserId =:id')
  Future<TaskUser?> getOneTaskUser(int id);
  @insert
  Future<int> addTaskUser(TaskUser d);
  @insert
  Future<List<int>> addListTaskUser(List<TaskUser> d);
  @update
  Future<int> updatesTaskUser(TaskUser d);
  @update
  Future<int> updatesTaskUserList(List<TaskUser> d);
  @Query('DELETE FROM TaskUser WHERE UserId = :id ')
  Future<int?> deleteTaskUser(int id);
  @delete
  Future<int?> deleteTaskUser2(TaskUser d);
  // Future<int> deleteTaskUserList(List<TaskUser> s);
  @Query('DELETE FROM TaskUser')
  Future<int?> deletAlleTaskUser();
 
}
