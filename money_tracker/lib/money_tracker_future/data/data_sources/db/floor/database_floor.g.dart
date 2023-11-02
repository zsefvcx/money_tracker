// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_floor.dart';

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
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER, `firstName` TEXT NOT NULL, `name` TEXT NOT NULL, `lastName` TEXT NOT NULL, `age` INTEGER NOT NULL, `image` TEXT NOT NULL, `locator` TEXT, `phone` TEXT NOT NULL, `uuid` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'name': item.name,
                  'lastName': item.lastName,
                  'age': item.age,
                  'image': item.image,
                  'locator': item.locator,
                  'phone': item.phone,
                  'uuid': item.uuid
                },
            changeListener),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'name': item.name,
                  'lastName': item.lastName,
                  'age': item.age,
                  'image': item.image,
                  'locator': item.locator,
                  'phone': item.phone,
                  'uuid': item.uuid
                },
            changeListener),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'firstName': item.firstName,
                  'name': item.name,
                  'lastName': item.lastName,
                  'age': item.age,
                  'image': item.image,
                  'locator': item.locator,
                  'phone': item.phone,
                  'uuid': item.uuid
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<List<User>> get() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            firstName: row['firstName'] as String,
            name: row['name'] as String,
            lastName: row['lastName'] as String,
            age: row['age'] as int,
            image: row['image'] as String,
            locator: row['locator'] as String?,
            phone: row['phone'] as String,
            uuid: row['uuid'] as String));
  }

  @override
  Stream<List<String>> findAllUserName() {
    return _queryAdapter.queryListStream('SELECT name FROM User',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'User',
        isView: false);
  }

  @override
  Stream<User?> findUserById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int?,
            firstName: row['firstName'] as String,
            name: row['name'] as String,
            lastName: row['lastName'] as String,
            age: row['age'] as int,
            image: row['image'] as String,
            locator: row['locator'] as String?,
            phone: row['phone'] as String,
            uuid: row['uuid'] as String),
        arguments: [id],
        queryableName: 'User',
        isView: false);
  }

  @override
  Future<int> insertUser(User person) {
    return _userInsertionAdapter.insertAndReturnId(
        person, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(User person) {
    return _userUpdateAdapter.updateAndReturnChangedRows(
        person, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(User person) {
    return _userDeletionAdapter.deleteAndReturnChangedRows(person);
  }
}
