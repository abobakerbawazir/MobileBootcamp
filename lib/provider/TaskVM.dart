import 'package:flutter/foundation.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
import 'package:taskmanagerprovider/database/db_helper.dart';

class TaskVM with ChangeNotifier {
  addTask(String title, String description, bool isActive) async {
    int x = await DBHelper.database.taskDao.addTask(
        Task(title: title, description: description, active: isActive));
    print(x);
    notifyListeners();
  }

  deleteTask(int id) async {
    int? x = await DBHelper.database.taskDao.deleteTask(id);
    print(x);
    notifyListeners();
  }

  updateTask(int id, String title, String description, bool isActive) async {
    int? x = await DBHelper.database.taskDao.updatesTask(Task(
        id: id,
        userId: 1,
        title: title,
        description: description,
        active: isActive));
    print(x);
    notifyListeners();
  }
}
