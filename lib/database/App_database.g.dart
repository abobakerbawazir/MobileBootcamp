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

  UserDao? _userDaoInstance;

  TaskDao? _taskDaoInstance;

  TaskUserDao? _taskUserDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `users` (`id` INTEGER, `username` TEXT, `password` TEXT, `phone_no` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tasks` (`id` INTEGER, `userId` INTEGER, `title` TEXT, `description` TEXT, `active` INTEGER, FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TaskUser` (`UserId` INTEGER, `TaskId` INTEGER, FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`TaskId`) REFERENCES `tasks` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`UserId`, `TaskId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TaskDao get taskDao {
    return _taskDaoInstance ??= _$TaskDao(database, changeListener);
  }

  @override
  TaskUserDao get taskUserDao {
    return _taskUserDaoInstance ??= _$TaskUserDao(database, changeListener);
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
            phone: row['phone_no'] as String?));
  }

  @override
  Future<User?> getOneUser(int id) async {
    return _queryAdapter.query('SELECT * FROM users WHERE id=?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            username: row['username'] as String?,
            password: row['password'] as String?,
            phone: row['phone_no'] as String?),
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
            phone: row['phone_no'] as String?),
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
            phone: row['phone_no'] as String?),
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

class _$TaskDao extends TaskDao {
  _$TaskDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskInsertionAdapter = InsertionAdapter(
            database,
            'tasks',
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'title': item.title,
                  'description': item.description,
                  'active': item.active == null ? null : (item.active! ? 1 : 0)
                }),
        _taskUpdateAdapter = UpdateAdapter(
            database,
            'tasks',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'title': item.title,
                  'description': item.description,
                  'active': item.active == null ? null : (item.active! ? 1 : 0)
                }),
        _taskDeletionAdapter = DeletionAdapter(
            database,
            'tasks',
            ['id'],
            (Task item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'title': item.title,
                  'description': item.description,
                  'active': item.active == null ? null : (item.active! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Task> _taskInsertionAdapter;

  final UpdateAdapter<Task> _taskUpdateAdapter;

  final DeletionAdapter<Task> _taskDeletionAdapter;

  @override
  Future<List<Task>> getAlltasks() async {
    return _queryAdapter.queryList('SELECT * FROM tasks',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            userId: row['userId'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            active:
                row['active'] == null ? null : (row['active'] as int) != 0));
  }

  @override
  Future<Task?> getOneTask(int id) async {
    return _queryAdapter.query('SELECT * FROM tasks WHERE id=?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            userId: row['userId'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<int?> deleteTask(int id) async {
    return _queryAdapter.query('DELETE FROM tasks WHERE id = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleTask() async {
    return _queryAdapter.query('DELETE FROM tasks',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<Task>> searchByName(String word) async {
    return _queryAdapter.queryList('SELECT * FROM tasks WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => Task(
            id: row['id'] as int?,
            userId: row['userId'] as int?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            active: row['active'] == null ? null : (row['active'] as int) != 0),
        arguments: [word]);
  }

  @override
  Future<int> addTask(Task u) {
    return _taskInsertionAdapter.insertAndReturnId(u, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListTask(List<Task> u) {
    return _taskInsertionAdapter.insertListAndReturnIds(
        u, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesTask(Task d) {
    return _taskUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesTaskList(List<Task> u) {
    return _taskUpdateAdapter.updateListAndReturnChangedRows(
        u, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTaskOfObject(Task u) {
    return _taskDeletionAdapter.deleteAndReturnChangedRows(u);
  }
}

class _$TaskUserDao extends TaskUserDao {
  _$TaskUserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _taskUserInsertionAdapter = InsertionAdapter(
            database,
            'TaskUser',
            (TaskUser item) => <String, Object?>{
                  'UserId': item.UserId,
                  'TaskId': item.TaskId
                }),
        _taskUserUpdateAdapter = UpdateAdapter(
            database,
            'TaskUser',
            ['UserId', 'TaskId'],
            (TaskUser item) => <String, Object?>{
                  'UserId': item.UserId,
                  'TaskId': item.TaskId
                }),
        _taskUserDeletionAdapter = DeletionAdapter(
            database,
            'TaskUser',
            ['UserId', 'TaskId'],
            (TaskUser item) => <String, Object?>{
                  'UserId': item.UserId,
                  'TaskId': item.TaskId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TaskUser> _taskUserInsertionAdapter;

  final UpdateAdapter<TaskUser> _taskUserUpdateAdapter;

  final DeletionAdapter<TaskUser> _taskUserDeletionAdapter;

  @override
  Future<List<TaskUser>> getAllTaskUsers() async {
    return _queryAdapter.queryList('SELECT * FROM TaskUser',
        mapper: (Map<String, Object?> row) => TaskUser(
            UserId: row['UserId'] as int?, TaskId: row['TaskId'] as int?));
  }

  @override
  Future<TaskUser?> getOneTaskUser(int id) async {
    return _queryAdapter.query('SELECT * FROM TaskUser WHERE UserId =?1',
        mapper: (Map<String, Object?> row) => TaskUser(
            UserId: row['UserId'] as int?, TaskId: row['TaskId'] as int?),
        arguments: [id]);
  }

  @override
  Future<int?> deleteTaskUser(int id) async {
    return _queryAdapter.query('DELETE FROM TaskUser WHERE UserId = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [id]);
  }

  @override
  Future<int?> deletAlleTaskUser() async {
    return _queryAdapter.query('DELETE FROM TaskUser',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<int> addTaskUser(TaskUser d) {
    return _taskUserInsertionAdapter.insertAndReturnId(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<List<int>> addListTaskUser(List<TaskUser> d) {
    return _taskUserInsertionAdapter.insertListAndReturnIds(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesTaskUser(TaskUser d) {
    return _taskUserUpdateAdapter.updateAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatesTaskUserList(List<TaskUser> d) {
    return _taskUserUpdateAdapter.updateListAndReturnChangedRows(
        d, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTaskUser2(TaskUser d) {
    return _taskUserDeletionAdapter.deleteAndReturnChangedRows(d);
  }
}
