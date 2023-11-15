import 'dart:io';

import 'package:money_tracker/core/logger/logger.dart';
import 'package:money_tracker/money_tracker_future/core/month/month_current.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';


class MonthsStatusImpl extends MonthsStatus {

  @override
  Future<MonthsCurrentYearEntity?> findAllInYear({required String uuid, required int year}) async {
      try{
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
          final data = await dbSqlLiteLocal.findAllMonthInYear(year);
          final monthsCurrentYearEntity = MonthsCurrentYearModel(
            uuid: uuid,
            year: year,
            months: data.toSet(),
          );
          return monthsCurrentYearEntity;
      } on Exception catch(e,t){
        Logger.print('Error $e\n$t', name: 'err', error: true);
        throw ArgumentError('Error findAllInYear month: $e\n$t');
      }
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    try {
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      await dbSqlLiteLocal.deleteAll();
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete!');
    }
  }

  @override
  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final id = await dbSqlLiteLocal.insert(data);

      return data.copyWithId(id: id);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert month: $e\n$t');
    }
  }

  @override
  Future<bool?> update({required String uuid, required MonthCurrent data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.update(data);

      return res>0;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert month: $e\n$t');
    }
  }

}
