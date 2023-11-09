import 'dart:async';

import 'package:floor/floor.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux)'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite;

part 'database_floor_month.g.dart'; // the generated code will be there

/*final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final personDao = database.personDao;
  final person = Person(1, 'Frank');

  await personDao.insertPerson(person);
  final result = await personDao.findPersonById(1);*/

@dao
abstract class MonthEnableDao {
  @Query('SELECT * FROM MonthEnable')
  Future<List<MonthCurrent>> get();

  @Query('SELECT month FROM MonthEnable WHERE year = :year')
  Future<List<int>> findAllMonthInYear(int year);

  @Query('SELECT * FROM MonthEnable WHERE id = :id')
  Future<MonthCurrent?> findMonthById(int id);

  @insert
  Future<int> insertMonth(MonthCurrent data);

  @update
  Future<int> updateMonth(MonthCurrent data);

  @delete
  Future<int> deleteMonth(MonthCurrent data);
}

@Database(version: 1, entities: [MonthCurrent])
abstract class AppDatabase extends FloorDatabase {
  MonthEnableDao get monthEnableDao;
}

///dart run build_runner build
