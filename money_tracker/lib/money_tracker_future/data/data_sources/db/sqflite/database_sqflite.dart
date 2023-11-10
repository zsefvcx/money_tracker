import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class DataBaseSqfLite {

  Future<List<int>> findAllMonthInYear(int year);

  Future<MonthCurrent?> findMonthById(int id);

  Future<int> insert(MonthCurrent data, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
  });

  Future<int> update(MonthCurrent data, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
  });

  Future<int> delete(int gid);
}

///https://pub.dev/packages/hive
///https://flutterbyexample.com/lesson/singletons
class DBProvider extends DataBaseSqfLite{
  DBProvider._internal();
  static Database? _database;

  static final DBProvider _db = DBProvider._internal();
  ///синглтон - один он в приложении...
  ///Его повсемесное использование в приложении плохой тон, но когда надо быстро то можно))
  ///Без использовния Factory
  static DBProvider get db => _db;

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    final dir = await getApplicationSupportDirectory();
    final path = '${dir.path}/months_base.db';
    Logger.print('PathToDB:$path');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  final String _table = 'MonthCurrent';
  final String _id = 'id';
  final String _year = 'year';
  final String _month = 'month';

  Future<void> _createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE "$_table" ( '
              '"$_id" INTEGER PRIMARY KEY AUTOINCREMENT, '
              '"$_year" INTEGER, '
              '"$_month" INTEGER, '
              ')'
      );
    } on Exception catch (e,t){
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error create db!');
    }
  }

  ///READ GROUP
  ///Пока получаем все элементы из списка
  @override
  Future<List<int>> findAllMonthInYear(int year) async {
    final db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_table,
          where: '$_year = ?',
          whereArgs: [year]
        );
    final groupList = <int>[];

    for (final element in groupsMapList) {
      groupList.add(
          MonthCurrent.fromJson(element).month
      );
    }
    return groupList;
  }


  ///INSERT findMonthById
  @override
  Future<MonthCurrent?> findMonthById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_table,
        where: '$_id = ?',
        whereArgs: [id]
    );

    for (final element in groupsMapList) {
      return MonthCurrent.fromJson(element);
    }
    return null;
  }

  ///INSERT Group
  @override
  Future<int> insert(MonthCurrent data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    final db = await database;

    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_group" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_description" TEXT');
    //await db.execute('ALTER TABLE "$_groupTable" ADD COLUMN "$_image" TEXT');

    /// должно быть уникальное
    final query = await db.query(_table,
        where: '"$_name" = ?',
        whereArgs: [data.name]);
    if (query.isNotEmpty){
      if (query[0].isNotEmpty){///только первое вхождение
        final id = query[0][_id];
        if (id != null && id is int){
          return id;
        }
      }
    }

    return await db.insert(
      _table,
      data.toJson(),
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  ///UPDATE Group
  @override
  Future<int> update(MonthCurrent data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    final db = await database;

    return await db.update(
        _table,
        data.toJson(),
        where: '"$_id" = ?',
        whereArgs: [data.id],
        conflictAlgorithm: conflictAlgorithm,
    );

  }

  ///DELETE GID
  @override
  Future<int> delete(int gid) async {
    final db = await database;
    return await db.delete(
            _table,
            where: '"$_id" = ?',
            whereArgs: [gid]
    );
  }

}
