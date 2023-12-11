import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
@dao
abstract class TaskDao {
  @Query('SELECT * FROM tasks')
  Future<List<Task>> getAlltasks();
  @Query('SELECT * FROM tasks WHERE id=:id')
  Future<Task?>getOneTask(int id);
  @insert
  Future<int> addTask(Task u);
  @insert
  Future<List<int>> addListTask(List<Task> u);
  @update
  Future<int> updatesTask(Task d);
  @update
  Future<int> updatesTaskList(List<Task> u);
  @Query('DELETE FROM tasks WHERE id = :id')
  Future<int?> deleteTask(int id);
  @delete
  Future<int?> deleteTaskOfObject(Task u);
  // Future<int> deleteTaskList(List<Task> s);
  @Query('DELETE FROM tasks')
  Future<int?> deletAlleTask();
  @Query('SELECT * FROM tasks WHERE name LIKE :word')
  Future<List<Task>> searchByName(String word);
}
