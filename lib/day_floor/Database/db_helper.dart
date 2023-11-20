import 'package:floor/floor.dart';
import 'package:flutter_application_2/day_floor/Database/App_database.dart';

class DBHelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db, _) {
        List<String> dep = ['IT', 'CS', 'OS', 'SWE','DBM'];
        String rusult = List.generate(
            dep.length, (index) => '(${index + 1},"${dep[index]}")').join(',');
        db.execute('INSERT INTO DEPARTMENT VALUES $rusult');
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder('bootcamp_database.db')
        .addCallback(callback)
        .build();
    return database;
  }
}
