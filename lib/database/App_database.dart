import 'dart:async';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/DAQs/TaskUser_dao.dart';
import 'package:taskmanagerprovider/DAQs/Task_dao.dart';
import 'package:taskmanagerprovider/DAQs/User_dao.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
import 'package:taskmanagerprovider/Entites/TaskUser.dart';
import 'package:taskmanagerprovider/Entites/User.dart';
part 'App_database.g.dart';

@Database(version: 1, entities: [User, Task, TaskUser])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  TaskDao get taskDao;
  TaskUserDao get taskUserDao;
}
