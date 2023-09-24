import 'dart:convert';
import 'dart:io';

import 'Opreations_files.dart';

class DBfile {
  // factory DBfile() => _this;
  static DBfile? _db;
  DBfile._();
  static DBfile createObject() {
    if (_db == null) {
      _db = DBfile._();
    }
    return _db!;
  }
  saveTable(String table_name, Map<String, dynamic> data) {}
}

  // static final DBfile _this = DBfile._();
  

// void addTask(List<Map<String, dynamic>> tasks) {
//   print('Enter a titie task ');
//   final title = stdin.readLineSync();
//   print('Enter a description task ');
//   final description = stdin.readLineSync();
//   tasks.add({'title': title, 'description': description});
//   print('Add task succesfuly ');
// }

