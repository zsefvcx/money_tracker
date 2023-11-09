// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_floor_month.dart';

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
            'CREATE TABLE IF NOT EXISTS `MonthCurrent` (`id` INTEGER, `year` INTEGER NOT NULL, `month` INTEGER NOT NULL, PRIMARY KEY (`id`))');

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
  )   : _queryAdapter = QueryAdapter(database),
        _monthCurrentInsertionAdapter = InsertionAdapter(
            database,
            'MonthCurrent',
            (MonthCurrent item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                }),
        _monthCurrentUpdateAdapter = UpdateAdapter(
            database,
            'MonthCurrent',
            ['id'],
            (MonthCurrent item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                }),
        _monthCurrentDeletionAdapter = DeletionAdapter(
            database,
            'MonthCurrent',
            ['id'],
            (MonthCurrent item) => <String, Object?>{
                  'id': item.id,
                  'year': item.year,
                  'month': item.month
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MonthCurrent> _monthCurrentInsertionAdapter;

  final UpdateAdapter<MonthCurrent> _monthCurrentUpdateAdapter;

  final DeletionAdapter<MonthCurrent> _monthCurrentDeletionAdapter;

  @override
  Future<List<MonthCurrent>> get() async {
    return _queryAdapter.queryList('SELECT * FROM MonthEnable',
        mapper: (Map<String, Object?> row) => MonthCurrent(
            id: row['id'] as int?,
            year: row['year'] as int,
            month: row['month'] as int));
  }

  @override
  Future<List<int>> findAllMonthInYear(int year) async {
    return _queryAdapter.queryList(
        'SELECT month FROM MonthEnable WHERE year = ?1',
        mapper: (Map<String, Object?> row) => row.values.first as int,
        arguments: [year]);
  }

  @override
  Future<MonthCurrent?> findMonthById(int id) async {
    return _queryAdapter.query('SELECT * FROM MonthEnable WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MonthCurrent(
            id: row['id'] as int?,
            year: row['year'] as int,
            month: row['month'] as int),
        arguments: [id]);
  }

  @override
  Future<int> insertMonth(MonthCurrent data) {
    return _monthCurrentInsertionAdapter.insertAndReturnId(
        data, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateMonth(MonthCurrent data) {
    return _monthCurrentUpdateAdapter.updateAndReturnChangedRows(
        data, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteMonth(MonthCurrent data) {
    return _monthCurrentDeletionAdapter.deleteAndReturnChangedRows(data);
  }
}
