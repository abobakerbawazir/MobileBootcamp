import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManager {
  String dbName = "Myactor.db";
  int dbversion = 2;
  Database? _db;

  static const String TBL_ACTORS = "actors";
  static const String TBL_AWARDS = "awards";

  
  static const String COL_ID = "id";
  static const String COL_NAME = "name";
  static const String COL_ACTORS_ID = "actors_id";
  /*  */
  

  Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbName, dbFolder);
    return openDatabase(version: dbversion,
      "path",
      onCreate: (db, version) {
        db.execute("""
create table if not exists $TBL_ACTORS(
  $COL_ID integer primary key autoincrement,
  $COL_NAME varcher(255) not null,
  )
""");
db.execute("""
create table if not exists $TBL_AWARDS(
  $COL_ID integer primary key autoincrement,
  $COL_NAME varcher(255) not null,
  $COL_ACTORS_ID integer not null,
  foreign key ($COL_ACTORS_ID) references $TBL_ACTORS($COL_ID)
  )
""");
      },
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
    data.remove(DBManager.COL_ID);
    return localDb.update(tble_name, data, where: "id=?", whereArgs: [id]);
  }

  Future<int> deleteData(String tble_name, int data) async {
    Database localDb = await dbObject;
   
   
    return localDb.delete(tble_name, where: "id=?", whereArgs: [data]);
  }

  addAllbatch(String tbl_Name, List<Map<String,dynamic>> data)async{
    Database localDb=await dbObject;
    Batch batch= localDb.batch();
    for ( var index =0  ; index <data.length ; index++ ){
      batch.insert(tbl_Name,data[index] );
    }
    
    batch.commit();
  }

//   Future<List<Map<String, dynamic>>> getAllData(String tble_name,
//       {List<String>? cols, List<dynamic>? args}) async {
//     Database localDb = await dbObject;
//     return localDb.query(tble_name);
//   }

//   Future<int> insertData(String tble_name, Map<String, dynamic> row) async {
//     Database localDb = await dbObject;
//     return localDb.insert(tble_name, row);
//   }

//   Future<int> updataeData(String tble_name, Map<String, dynamic> data) async {
//     Database localDb = await dbObject;
//     int id = data["id"];
//     data.remove(DBManager.COL_ID);
//     return localDb.update(tble_name, data, where: "id=?", whereArgs: [id]);
//   }

//   Future<int> deleteData(String tble_name, int data) async {
//     Database localDb = await dbObject;
   
   
//     return localDb.delete(tble_name, where: "id=?", whereArgs: [data]);
//   }
}
