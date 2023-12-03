// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'App_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RoleDao? _roleDoaInstance;

  CarDao? _carDaoInstance;

  UserDao? _userDaoInstance;

  BookingDao? _bookingDaoInstance;

  PrandDao? _prandDaoInstance;

  ImageDao? _imageDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cars` (`id` INTEGER, `prandId` INTEGER, `name` TEXT, `model` TEXT, `active` INTEGER, `price` INTEGER, FOREIGN KEY (`prandId`) REFERENCES `Prand` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Prand` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `images` (`id` INTEGER, `name` BLOB, `car_id` INTEGER, FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Booking` (`carId` INTEGER, `userId` INTEGER, `from` TEXT, `to` TEXT, `total` INTEGER, FOREIGN KEY (`carId`) REFERENCES `cars` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`carId`, `userId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER, `roleId` INTEGER, `username` TEXT, `password` TEXT, `phone_no` TEXT, FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `roles` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_users_phone_no` ON `users` (`phone_no`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RoleDao get roleDoa {
    return _roleDoaInstance ??= _$RoleDao(database, changeListener);
  }

  @override
  CarDao get carDao {
    return _carDaoInstance ??= _$CarDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  BookingDao get bookingDao {
    return _bookingDaoInstance ??= _$BookingDao(database, changeListener);
  }

  @override
  PrandDao get prandDao {
    return _prandDaoInstance ??= _$PrandDao(database, changeListener);
  }

  @override
  ImageDao get imageDao {
    return _imageDaoInstance ??= _$ImageDao(database, changeListener);
  }
}

class _$RoleDao extends RoleDao {
  _$RoleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _roleInsertionAdapter = InsertionAdapter(database, 'roles',
            (Role item) => <String, Object?>{'id': item.id, 'name': item.name}),
        _roleUpdateAdapter = UpdateAdapter(database, 'roles', ['id'],
            (Role item) => <String, Object?>{'id': item.id, 'name': item.name}),
        _roleDeletionAdapter = DeletionAdapter(database, 'roles', ['id'],
            (Role item) => <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Role> _roleInsertionAdapter;

  final UpdateAdapter<Role> _roleUpdateAdapter;

  final DeletionAdapter<Role> _roleDeletionAdapter;

  @override
  Future<List<Role>> getAllRoles() async {
    return _queryAdapter.queryList('SELECT * FROM roles',
        mapper: (Map<String, Object?> row) =>
            Role(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<Role?> getOneRole(int id) async {
    return _queryAdapter.query('SELECT * FROM roles WHERE id=?1',
        mapper: (Map<String, Object?> row) =>
            Role(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteRole(int id) async {
    return _queryAdapter.query('DELETE FROM roles WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleRole() async {
    return _queryAdapter.query('DELETE FROM roles',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Role>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM roles WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            Role(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [word]);
  }

  @override
  Future<int> addRole(Role d) {
    return _roleInsertionAdapter.insertAndReturnId(d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListRole(List<Role> d) {
    return _roleInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesRole(Role d) {
    return _roleUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesRoleList(List<Role> d) {
    return _roleUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteRoleOfObject(Role d) {
    return _roleDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}

class _$CarDao extends CarDao {
  _$CarDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _carInsertionAdapter = InsertionAdapter(
            database,
            'cars',
            (Car item) => <String, Object?>{
                  'id': item.id,
                  'prandId': item.prandId,
                  'name': item.name,
                  'model': item.model,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'price': item.price
                }),
        _carUpdateAdapter = UpdateAdapter(
            database,
            'cars',
            ['id'],
            (Car item) => <String, Object?>{
                  'id': item.id,
                  'prandId': item.prandId,
                  'name': item.name,
                  'model': item.model,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'price': item.price
                }),
        _carDeletionAdapter = DeletionAdapter(
            database,
            'cars',
            ['id'],
            (Car item) => <String, Object?>{
                  'id': item.id,
                  'prandId': item.prandId,
                  'name': item.name,
                  'model': item.model,
                  'active': item.active == null ? null : (item.active! ? 1 : 0),
                  'price': item.price
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Car> _carInsertionAdapter;

  final UpdateAdapter<Car> _carUpdateAdapter;

  final DeletionAdapter<Car> _carDeletionAdapter;

  @override
  Future<List<Car>> getAllImagesAndCars() async {
    return _queryAdapter.queryList('select cars.* from cars',
        mapper: (Map<String, Object?> row) => Car(
            id: row['id'] as int?,
            name: row['name'] as String?,
            model: row['model'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            price: row['price'] as int?,
            prandId: row['prandId'] as int?));
  }

  @override
  Future<List<Car>> getAllCars() async {
    return _queryAdapter.queryList('SELECT * FROM cars',
        mapper: (Map<String, Object?> row) => Car(
            id: row['id'] as int?,
            name: row['name'] as String?,
            model: row['model'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            price: row['price'] as int?,
            prandId: row['prandId'] as int?));
  }

  @override
  Future<List<Car>> getAllCarsByPrandIdOnly(int prandId) async {
    return _queryAdapter.queryList('SELECT * FROM cars WHERE prandId=?1',
        mapper: (Map<String, Object?> row) => Car(
            id: row['id'] as int?,
            name: row['name'] as String?,
            model: row['model'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            price: row['price'] as int?,
            prandId: row['prandId'] as int?),
        arguments: [prandId]);
  }

  @override
  Future<Car?> getOneCar(int id) async {
    return _queryAdapter.query('SELECT * FROM cars WHERE id=?1',
        mapper: (Map<String, Object?> row) => Car(
            id: row['id'] as int?,
            name: row['name'] as String?,
            model: row['model'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            price: row['price'] as int?,
            prandId: row['prandId'] as int?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteCar(int id) async {
    return _queryAdapter.query('DELETE FROM cars WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleCar() async {
    return _queryAdapter.query('DELETE FROM cars',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Car>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM cars WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => Car(
            id: row['id'] as int?,
            name: row['name'] as String?,
            model: row['model'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0,
            price: row['price'] as int?,
            prandId: row['prandId'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addCar(Car d) {
    return _carInsertionAdapter.insertAndReturnId(d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListCar(List<Car> d) {
    return _carInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesCar(Car d) {
    return _carUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesCarList(List<Car> d) {
    return _carUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCarOfObject(Car d) {
    return _carDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'users',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'roleId': item.roleId,
                  'username': item.username,
                  'password': item.password,
                  'phone_no': item.phone
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'roleId': item.roleId,
                  'username': item.username,
                  'password': item.password,
                  'phone_no': item.phone
                }),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'users',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'roleId': item.roleId,
                  'username': item.username,
                  'password': item.password,
                  'phone_no': item.phone
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> getAllusers() async {
    return _queryAdapter.queryList('SELECT * FROM users',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String?,
            password: row['password'] as String?,
            phone: row['phone_no'] as String?,
            roleId: row['roleId'] as int?));
  }

  @override
  Future<User?> getOneUser(int id) async {
    return _queryAdapter.query('SELECT * FROM users WHERE id=?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String?,
            password: row['password'] as String?,
            phone: row['phone_no'] as String?,
            roleId: row['roleId'] as int?),
        arguments: [id]);
  }

  @override
  Future<User?> getOneUserByuserNameAndPassword(
    String username,
    String password,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM users WHERE username=?1 and password=?2',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String?,
            password: row['password'] as String?,
            phone: row['phone_no'] as String?,
            roleId: row['roleId'] as int?),
        arguments: [username, password]);
  }

  @override
  Future<int?> deleteUser(int id) async {
    return _queryAdapter.query('DELETE FROM users WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleUser() async {
    return _queryAdapter.query('DELETE FROM users',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<User>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM users WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String?,
            password: row['password'] as String?,
            phone: row['phone_no'] as String?,
            roleId: row['roleId'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addUser(User u) {
    return _userInsertionAdapter.insertAndReturnId(u, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListUser(List<User> u) {
    return _userInsertionAdapter.insertListAndReturnIds(
        u, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesUser(User d) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesUserList(List<User> u) {
    return _userUpdateAdapter.updateListAndReturnChangedRows(
        u, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUserOfObject(User u) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(u);
  }
}

class _$BookingDao extends BookingDao {
  _$BookingDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookingInsertionAdapter = InsertionAdapter(
            database,
            'Booking',
            (Booking item) => <String, Object?>{
                  'carId': item.carId,
                  'userId': item.userId,
                  'from': item.from,
                  'to': item.to,
                  'total': item.total
                }),
        _bookingUpdateAdapter = UpdateAdapter(
            database,
            'Booking',
            ['carId', 'userId'],
            (Booking item) => <String, Object?>{
                  'carId': item.carId,
                  'userId': item.userId,
                  'from': item.from,
                  'to': item.to,
                  'total': item.total
                }),
        _bookingDeletionAdapter = DeletionAdapter(
            database,
            'Booking',
            ['carId', 'userId'],
            (Booking item) => <String, Object?>{
                  'carId': item.carId,
                  'userId': item.userId,
                  'from': item.from,
                  'to': item.to,
                  'total': item.total
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Booking> _bookingInsertionAdapter;

  final UpdateAdapter<Booking> _bookingUpdateAdapter;

  final DeletionAdapter<Booking> _bookingDeletionAdapter;

  @override
  Future<List<Booking>> getAllBooking() async {
    return _queryAdapter.queryList('SELECT * FROM Booking',
        mapper: (Map<String, Object?> row) => Booking(
            carId: row['carId'] as int?,
            userId: row['userId'] as int?,
            from: row['from'] as String?,
            to: row['to'] as String?,
            total: row['total'] as int?));
  }

  @override
  Future<List<Booking>> getAllBookingOfUser(int userId) async {
    return _queryAdapter.queryList('SELECT * FROM Booking WHERE userId=?1',
        mapper: (Map<String, Object?> row) => Booking(
            carId: row['carId'] as int?,
            userId: row['userId'] as int?,
            from: row['from'] as String?,
            to: row['to'] as String?,
            total: row['total'] as int?),
        arguments: [userId]);
  }

  @override
  Future<List<Booking>> getAllBookingOfCar(int carId) async {
    return _queryAdapter.queryList('SELECT * FROM Booking WHERE carId=?1',
        mapper: (Map<String, Object?> row) => Booking(
            carId: row['carId'] as int?,
            userId: row['userId'] as int?,
            from: row['from'] as String?,
            to: row['to'] as String?,
            total: row['total'] as int?),
        arguments: [carId]);
  }

  @override
  Future<Booking?> getOneBooking(int id) async {
    return _queryAdapter.query('SELECT * FROM Booking WHERE id=?1',
        mapper: (Map<String, Object?> row) => Booking(
            carId: row['carId'] as int?,
            userId: row['userId'] as int?,
            from: row['from'] as String?,
            to: row['to'] as String?,
            total: row['total'] as int?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteBooking(int id) async {
    return _queryAdapter.query('DELETE FROM Booking WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleBooking() async {
    return _queryAdapter.query('DELETE FROM Booking',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Booking>> searchByCarId(String word) async {
    return _queryAdapter.queryList('SELECT * FROM Booking WHERE carId LIKE ?1',
        mapper: (Map<String, Object?> row) => Booking(
            carId: row['carId'] as int?,
            userId: row['userId'] as int?,
            from: row['from'] as String?,
            to: row['to'] as String?,
            total: row['total'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addBooking(Booking d) {
    return _bookingInsertionAdapter.insertAndReturnId(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListBooking(List<Booking> d) {
    return _bookingInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesBooking(Booking d) {
    return _bookingUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesBookingList(List<Booking> d) {
    return _bookingUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteBookingOfObject(Booking d) {
    return _bookingDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}

class _$PrandDao extends PrandDao {
  _$PrandDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _prandInsertionAdapter = InsertionAdapter(
            database,
            'Prand',
            (Prand item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _prandUpdateAdapter = UpdateAdapter(
            database,
            'Prand',
            ['id'],
            (Prand item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _prandDeletionAdapter = DeletionAdapter(
            database,
            'Prand',
            ['id'],
            (Prand item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Prand> _prandInsertionAdapter;

  final UpdateAdapter<Prand> _prandUpdateAdapter;

  final DeletionAdapter<Prand> _prandDeletionAdapter;

  @override
  Future<List<Prand>> getAllPrands() async {
    return _queryAdapter.queryList('SELECT * FROM Prand',
        mapper: (Map<String, Object?> row) =>
            Prand(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<Prand?> getOnePrand(int id) async {
    return _queryAdapter.query('SELECT * FROM Prand WHERE id=?1',
        mapper: (Map<String, Object?> row) =>
            Prand(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<int?> deletePrand(int id) async {
    return _queryAdapter.query('DELETE FROM Prand WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAllePrand() async {
    return _queryAdapter.query('DELETE FROM Prand',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Prand>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM Prand WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) =>
            Prand(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [word]);
  }

  @override
  Future<int> addPrand(Prand d) {
    return _prandInsertionAdapter.insertAndReturnId(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListPrand(List<Prand> d) {
    return _prandInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesPrand(Prand d) {
    return _prandUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesPrandList(List<Prand> d) {
    return _prandUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deletePrandOfObject(Prand d) {
    return _prandDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}

class _$ImageDao extends ImageDao {
  _$ImageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _imageCarInsertionAdapter = InsertionAdapter(
            database,
            'images',
            (ImageCar item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'car_id': item.carId
                }),
        _imageCarUpdateAdapter = UpdateAdapter(
            database,
            'images',
            ['id'],
            (ImageCar item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'car_id': item.carId
                }),
        _imageCarDeletionAdapter = DeletionAdapter(
            database,
            'images',
            ['id'],
            (ImageCar item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'car_id': item.carId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ImageCar> _imageCarInsertionAdapter;

  final UpdateAdapter<ImageCar> _imageCarUpdateAdapter;

  final DeletionAdapter<ImageCar> _imageCarDeletionAdapter;

  @override
  Future<List<ImageCar>> getAllImagesAndCars() async {
    return _queryAdapter.queryList(
        'select * from images inner join cars where cars.id=images.carId group by cars.name',
        mapper: (Map<String, Object?> row) => ImageCar(
            id: row['id'] as int?,
            name: row['name'] as Uint8List?,
            carId: row['car_id'] as int?));
  }

  @override
  Future<List<ImageCar>> getAllImages() async {
    return _queryAdapter.queryList('SELECT * FROM images',
        mapper: (Map<String, Object?> row) => ImageCar(
            id: row['id'] as int?,
            name: row['name'] as Uint8List?,
            carId: row['car_id'] as int?));
  }

  @override
  Future<List<ImageCar>> getAllImagesOfCarId(int carId) async {
    return _queryAdapter.queryList('SELECT * FROM images WHERE car_id=?1',
        mapper: (Map<String, Object?> row) => ImageCar(
            id: row['id'] as int?,
            name: row['name'] as Uint8List?,
            carId: row['car_id'] as int?),
        arguments: [carId]);
  }

  @override
  Future<ImageCar?> getOneImage(int car_id) async {
    return _queryAdapter.query(
        'SELECT * FROM images WHERE car_id=?1 ORDER BY car_id LIMIT 1',
        mapper: (Map<String, Object?> row) => ImageCar(
            id: row['id'] as int?,
            name: row['name'] as Uint8List?,
            carId: row['car_id'] as int?),
        arguments: [car_id]);
  }

  @override
  Future<int?> deleteImage(int id) async {
    return _queryAdapter.query('DELETE FROM images WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleImage() async {
    return _queryAdapter.query('DELETE FROM images',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<ImageCar>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM images WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => ImageCar(
            id: row['id'] as int?,
            name: row['name'] as Uint8List?,
            carId: row['car_id'] as int?),
        arguments: [word]);
  }

  @override
  Future<int> addImage(ImageCar d) {
    return _imageCarInsertionAdapter.insertAndReturnId(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListImage(List<ImageCar> d) {
    return _imageCarInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesImage(ImageCar d) {
    return _imageCarUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesImageList(List<ImageCar> d) {
    return _imageCarUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteImageOfObject(ImageCar d) {
    return _imageCarDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}
