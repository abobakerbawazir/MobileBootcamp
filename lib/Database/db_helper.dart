import 'package:car_booking/Database/App_database.dart';
import 'package:floor/floor.dart';

class DBHelper {
  static late AppDatabase database;
  static initDatabase() async {
    Callback callback = Callback(
      onCreate: (db, _) {
        List<String> roles = ['Admin', 'Customer'];
        List<String> prands = [
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
        String resultRoles = List.generate(
                roles.length, (index) => '(${index + 1},"${roles[index]}")')
            .join(',');
        String rusult = List.generate(
                prands.length, (index) => '(${index + 1},"${prands[index]}")')
            .join(',');
        db.execute('INSERT INTO PRAND VALUES $rusult');
        db.execute('INSERT INTO ROLES VALUES $resultRoles');
        db.execute(
            'INSERT INTO Users VALUES (1,1,"MyAdmin","123456789","775630183")');
        db.execute('INSERT INTO CARS VALUES (1,1,"Hilux","2017",false,2000)');
        db.execute('INSERT INTO CARS VALUES (2,1,"Fortuner","2017",false,300)');
        db.execute(
            'INSERT INTO CARS VALUES (3,1,"Land Cruiser","2017",false,2500)');
      },
    );
    database = await $FloorAppDatabase
        .databaseBuilder('car_database.db')
        .addCallback(callback)
        .build();
    return database;
  }
}
