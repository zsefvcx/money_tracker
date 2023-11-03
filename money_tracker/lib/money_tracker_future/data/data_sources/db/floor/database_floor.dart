import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux)'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite;

part 'database_floor.g.dart'; // the generated code will be there

@entity
class MonthEnable {
  @primaryKey
  final int id;

  final String year;
  final String month;

  MonthEnable({required this.id, required this.year, required this.month});
}

/*final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final personDao = database.personDao;
  final person = Person(1, 'Frank');

  await personDao.insertPerson(person);
  final result = await personDao.findPersonById(1);*/

@dao
abstract class MonthEnableDao {
  @Query('SELECT * FROM MonthEnable')
  Future<List<MonthEnable>> get();

  // @Query('SELECT name FROM MonthEnable')
  // Stream<List<String>> findAllUserName();

  @Query('SELECT * FROM MonthEnable WHERE id = :id')
  Stream<MonthEnable?> findUserById(int id);

  @insert
  Future<int> insertMonth(MonthEnable data);

  @update
  Future<int> updateMonth(MonthEnable data);

  @delete
  Future<int> deleteMonth(MonthEnable data);
}

@Database(version: 1, entities: [MonthEnable])
abstract class AppDatabase extends FloorDatabase {
  MonthEnableDao get monthEnableDao;
}

///dart run build_runner build
