import 'dart:io';

import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data_sources/db/db.dart';
import 'package:money_tracker/money_tracker_future/data/models/categories/categories.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseSqfLiteImpl implements DataBaseMonthSqfLite, DataBaseCategorySqfLite{
  static String? _lastUuid;
  final String _uuid;

  DataBaseSqfLiteImpl._({required String uuid}): _uuid = uuid;

  static DataBaseSqfLiteImpl? _db;
  static Database? _database;

  Future<String> localPath({required String uuid}) async {
    final directory = await getApplicationSupportDirectory();
    final path = '${directory.path}/${uuid}_database.db';
    Logger.print('PathToPhoto:$path');
    return path;
  }

  Future<File> localFile({required String uuid}) async {
    return File(await localPath(uuid: uuid));
  }

  Future<Database> get database async {
    return _database ??= await _initDB(uuid: _uuid);
  }

  Future<Database> _initDB({required String uuid}) async {
    final path = await localPath(uuid: uuid);
    _lastUuid = uuid;
    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  static DataBaseSqfLiteImpl db({required String uuid}) {
    if (_lastUuid != uuid){
      _database?.close();
      _database = null;
      _db = null;
    }
    _lastUuid = uuid;
    return _db ??= DataBaseSqfLiteImpl._(uuid: uuid);
  }

  //v1
  static const String _tableMonthCurrent = 'MonthCurrent';
  static const String _id = 'id';
  static const String _year = 'year';
  static const String _month = 'month';
  //v2
  static const String _tableCategories = 'Categories';
  static const String _name = 'name';
  static const String _colorHex = 'colorHex';


  Future<void> _createDB(Database db, int version) async {
    try {
      if(version >=1){
        await db.execute(
            'CREATE TABLE "$_tableMonthCurrent" ( '
                '"$_id" INTEGER PRIMARY KEY AUTOINCREMENT, '
                '"$_year" INTEGER, '
                '"$_month" INTEGER '
                ')'
        );
      }
      if(version >=2){
        await db.execute(
            'CREATE TABLE "$_tableCategories" ( '
                '"$_id" INTEGER PRIMARY KEY AUTOINCREMENT, '
                '"$_name" INTEGER, '
                '"$_colorHex" INTEGER '
                ')'
        );
      }
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
        await db.query(_tableMonthCurrent,
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
        await db.query(_tableMonthCurrent,
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
  Future<int> insertMonth(MonthCurrent data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      }) async {
    final db = await database;

    /// должно быть уникальное
    final query = await db.query(_tableMonthCurrent,
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
      _tableMonthCurrent,
      data.toJson(),
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  ///DELETE GID
  @override
  Future<int> deleteMonth(int gid) async {
    final db = await database;
    return await db.delete(
            _tableMonthCurrent,
            where: '"$_id" = ?',
            whereArgs: [gid]
    );
  }

  ///DELETE ALL
  Future<void> deleteAll() async {
    await _database?.close();
    _database = null;
    final file = await localFile(uuid: _uuid);
    await file.delete();
  }

  @override
  Future<CategoriesExpenses?> getAllCategoryId() async {
    final db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_tableCategories,
    );
    final allId = <CategoryExpenses>{};

    for (final element in groupsMapList) {
      allId.add(
          CategoryExpenses.fromJson(element)
      );
    }
    return CategoriesExpenses(
      categoriesId: allId
    );
  }

  @override
  Future<CategoryExpenses?> getCategoryById({required int id}) async {
    final db = await database;
    final List<Map<String, dynamic>> groupsMapList =
        await db.query(_tableCategories,
        where: '$_id = ?',
        whereArgs: [id]
    );

    for (final element in groupsMapList) {
      return CategoryExpenses.fromJson(element);
    }
    return null;
  }

  @override
  Future<int> deleteCategory(int id) async {
    final db = await database;
    return await db.delete(
        _tableCategories,
        where: '"$_id" = ?',
        whereArgs: [id]
    );
  }

  @override
  Future<int> insertCategory(CategoryExpenses data, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
  }) async {
    final db = await database;

    ///имя должно быть уникальное
    final query = await db.query(_tableCategories,
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

    ///имя и цвет тоже должны быть уникальными
    final query2 = await db.query(_tableCategories,
        where: '"$_name" = ? and "$_colorHex" = ?',
        whereArgs: [data.name, data.colorHex]);

    if (query2.isNotEmpty){
      if (query2[0].isNotEmpty){///только первое вхождение
        final id = query2[0][_id];
        if (id != null && id is int){
          return id;
        }
      }
    }

    return await db.insert(
      _tableCategories,
      data.toJson(),
      conflictAlgorithm: conflictAlgorithm,
    );
  }
}
