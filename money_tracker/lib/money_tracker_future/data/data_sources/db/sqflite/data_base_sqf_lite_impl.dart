import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data_sources/db/db.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseSqfLiteImpl extends DataBaseSqfLite{

  DataBaseSqfLiteImpl({required super.database});

  static const String _table = 'MonthCurrent';
  static const String _id = 'id';
  static const String _year = 'year';
  static const String _month = 'month';

  static Future<void> createDB(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE "$_table" ( '
              '"$_id" INTEGER PRIMARY KEY AUTOINCREMENT, '
              '"$_year" INTEGER, '
              '"$_month" INTEGER '
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
    final db = database;
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
    final db = database;
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
    final db = database;

    /// должно быть уникальное
    final query = await db.query(_table,
         where: '"$_year" = ? and "$_month" = ?',
         whereArgs: [data.year, data.month]);

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
    final db = database;

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
    final db = database;
    return await db.delete(
            _table,
            where: '"$_id" = ?',
            whereArgs: [gid]
    );
  }

}
