import 'package:flutter/foundation.dart';
import 'package:taskmanagerprovider/Entites/TaskUser.dart';
import 'package:taskmanagerprovider/database/db_helper.dart';

class UserTaskVM with ChangeNotifier {
  addTaskUser({int? UserId, int? TaskId}) async {
    int x = await DBHelper.database.taskUserDao
        .addTaskUser(TaskUser(UserId: UserId, TaskId: TaskId));
    print(x);
    notifyListeners();
  }

  deleteTaskUser(int id) async {
    int? x = await DBHelper.database.taskUserDao.deleteTaskUser(id);
    print(x);
    notifyListeners();
  }

  updateteTaskUser(int? UserId, int? TaskId) async {
    int? x = await DBHelper.database.taskUserDao
        .updatesTaskUser(TaskUser(TaskId: TaskId, UserId: UserId));
    print(x);
    notifyListeners();
  }
}
