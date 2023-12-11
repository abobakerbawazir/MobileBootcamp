import 'package:floor/floor.dart';
import 'package:taskmanagerprovider/database/App_database.dart';

class DBHelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db, _) {
        db.execute(
            'INSERT INTO users VALUES (1,"MyAdmin","123456789","775630183")');
            db.execute(
            'INSERT INTO users VALUES (2,"Abobaker","12345","77362318")');
            db.execute(
            'INSERT INTO users VALUES (3,"Ali","12345","712526301")');
            db.execute(
            'INSERT INTO tasks VALUES (1,1,"Reed A book","Book has to 5 dayes to completed reading",1)');
            db.execute(
            'INSERT INTO tasks VALUES (2,1,"go to shopping","shopping is waiting",1)');
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder('provider_database.db')
        .addCallback(callback)
        .build();
    return database;
  }
}
