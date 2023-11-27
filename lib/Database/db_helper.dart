import 'package:car_booking/Database/App_database.dart';
import 'package:floor/floor.dart';

class DBHelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db, _) {
        List<String> dep = [
          'TOYOTA',
          'LEXUS',
          'mazda',
          'GMC',
          'SUZUKI',
          'KIA',
          'Tesla',
          'Mazda',
          'Nissan',
          'Volvo',
          'Land Rover',
          'HINDAY',
          'BMW'
        ];
        String rusult = List.generate(
            dep.length, (index) => '(${index + 1},"${dep[index]}")').join(',');
        db.execute('INSERT INTO PRAND VALUES $rusult');
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder('car_database.db')
        .addCallback(callback)
        .build();
    return database;
  }
}
