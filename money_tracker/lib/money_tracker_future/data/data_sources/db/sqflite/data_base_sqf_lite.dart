import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class DataBaseSqfLite {

  Database database;

  DataBaseSqfLite({required this.database});

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
