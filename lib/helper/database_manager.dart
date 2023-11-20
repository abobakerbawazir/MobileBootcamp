import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManger {
  Database? _db;
  String dbName = "storesess.db";
  int dbVersion = 1;

  /** start table and columns for products table */
  static const String TBL_PRODUCTS = "products";
  static const String COL_ID = "id";
  static const String COL_TITLE = "title";
  static const String COL_DESCRIPTION = "description";
  static const String COL_PRICE = "price";
  static const String COL_STOCK = "stock";
  static const String COL_BRAND = "brand";
  static const String COL_CATEGORY = "category";
  static const String COL_THUMBNAIL = "thumbnail";

  /** start table and columns for images table */
  static const String TBL_IMAGES = "images";
  static const String COL_PRODUCT_ID = "product_id";
  static const String COL_IMAGE = "image";

  Future<Database> get dbObject async {
    if (_db == null) _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);
    return await openDatabase(dbPath, version: dbVersion, onCreate: (db, v) {
      db.execute("""
      create table if not exists $TBL_PRODUCTS (
      $COL_ID integer primary key autoincrement,
      $COL_TITLE varchar(255) not null,
      $COL_DESCRIPTION text not null,
      $COL_BRAND varchar(255) not null,
      $COL_CATEGORY varchar(255) not null,
      $COL_THUMBNAIL varchar(255) not null,
      $COL_STOCK integer not null,
      $COL_PRICE integer not null
     
      )
      """);

      db.execute("""
      create table if not exists $TBL_IMAGES (
      $COL_ID integer primary key autoincrement,
      $COL_PRODUCT_ID integer not null,
      $COL_IMAGE varchar(255) not null,
      FOREIGN KEY($COL_PRODUCT_ID) REFERENCES $TBL_PRODUCTS($COL_ID)
      )
      """);
    });
  }

  /** add to table */
  Future<int> insert(String tbl_name, Map<String, dynamic> row,
      {String? foreignTable = null,
      List<Map<String, dynamic>>? sub_rows = null,
      String? COL_ID_PEIMARY_KEY }) async {
    Database localDB = await dbObject;
    int id = -1;
    if (foreignTable != null) {
      id = await localDB.insert(tbl_name, row);
      sub_rows!.forEach((element) {
        element[COL_ID_PEIMARY_KEY!] = id;
        localDB.insert(foreignTable, element);
      });
    }
    return await id;
  }

  /** delete from table */
  Future<int> delete(String sql) async {
    Database localDB = await dbObject;
    return localDB.rawDelete(sql);
  }

  /** get from table */
  Future<List<Map<String, dynamic>>> fetch(String sql) async {
    Database localDB = await dbObject;
    return localDB.rawQuery(sql);
  }
}
