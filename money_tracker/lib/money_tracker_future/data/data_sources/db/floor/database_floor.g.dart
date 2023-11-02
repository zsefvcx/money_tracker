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

  MonthEnableDao? _monthEnableDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `MonthEnable` (`id` INTEGER NOT NULL, `year` TEXT NOT NULL, `month` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MonthEnableDao get monthEnableDao {
    return _monthEnableDaoInstance ??=
        _$MonthEnableDao(database, changeListener);
  }
}

class _$MonthEnableDao extends MonthEnableDao {
  _$MonthEnableDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _monthEnableInsertionAdapter = InsertionAdapter(
            database,
            'MonthEnable',
            (MonthEnable item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                },
            changeListener),
        _monthEnableUpdateAdapter = UpdateAdapter(
            database,
            'MonthEnable',
            ['id'],
            (MonthEnable item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                },
            changeListener),
        _monthEnableDeletionAdapter = DeletionAdapter(
            database,
            'MonthEnable',
            ['id'],
            (MonthEnable item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MonthEnable> _monthEnableInsertionAdapter;

  final UpdateAdapter<MonthEnable> _monthEnableUpdateAdapter;

  final DeletionAdapter<MonthEnable> _monthEnableDeletionAdapter;

  @override
  Future<List<MonthEnable>> get() async {
    return _queryAdapter.queryList('SELECT * FROM User',
        mapper: (Map<String, Object?> row) => MonthEnable(
            id: row['id'] as int,
            year: row['year'] as String,
            month: row['month'] as String));
  }

  @override
  Stream<List<String>> findAllUserName() {
    return _queryAdapter.queryListStream('SELECT name FROM User',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'User',
        isView: false);
  }

  @override
  Stream<MonthEnable?> findUserById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM User WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MonthEnable(
            id: row['id'] as int,
            year: row['year'] as String,
            month: row['month'] as String),
        arguments: [id],
        queryableName: 'User',
        isView: false);
  }

  @override
  Future<int> insertMonth(MonthEnable data) {
    return _monthEnableInsertionAdapter.insertAndReturnId(
        data, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateMonth(MonthEnable data) {
    return _monthEnableUpdateAdapter.updateAndReturnChangedRows(
        data, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteMonth(MonthEnable data) {
    return _monthEnableDeletionAdapter.deleteAndReturnChangedRows(data);
  }
}
