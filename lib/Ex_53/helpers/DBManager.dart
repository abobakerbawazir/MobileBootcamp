import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  Database? _db;
  static const String dbName = "xs.db";
  static const int dbVersion = 1;
  static const String TBL_INCOME_NAME = "incomes";
  static const String COL_ID_NAME = "id";
  static const String COL_OPERATOR_NAME = "opreator";
  static const String COL_AMOUNT_NAME = "amount";

  Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);
    return openDatabase(
      "path",
      onCreate: (db, version) {
        db.execute("""
create table if not exists incomes(
  $COL_ID_NAME integer primary key autoincrement,
  $COL_OPERATOR_NAME varcher(255) not null,
  $COL_AMOUNT_NAME integer not null)
""");
      },
      version: dbVersion,
    );
  }

  Future<List<Map<String, dynamic>>> getAllData(String tble_name) async {
    try {
      Database localDb = await dbObject;
      return localDb.query(tble_name);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> insertData(String tble_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    return localDb.insert(tble_name, data);
  }

  Future<int> updataeData(String tble_name, Map<String, dynamic> data) async {
    Database localDb = await dbObject;
    int id = data["id"];
    data.remove(DBManager.COL_ID_NAME);
    return localDb.update(tble_name, data, where: "id=?", whereArgs: [id]);
  }

  Future<int> deleteData(String tble_name, int data) async {
    Database localDb = await dbObject;
   
   
    return localDb.delete(tble_name, where: "id=?", whereArgs: [data]);
  }
}
