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

  String? lastUuid;
  DataBaseSqfLite? _dbSqfLite;
  Database? _database;

  Future<DataBaseSqfLite> dbSqfLite({required String uuid}) async {
    final dbSqfLite = _dbSqfLite;
    if(lastUuid == null || lastUuid == uuid){
      if(_database==null && dbSqfLite != null){
        dbSqfLite.database = await database(uuid: uuid);
        return dbSqfLite;
      }
      return _dbSqfLite ??= DataBaseSqfLiteImpl(
          database: await database(uuid: uuid)
      );
    } else if((lastUuid != null && lastUuid != uuid)|| _database==null){
      if (dbSqfLite != null){
        dbSqfLite.database = await database(uuid: uuid);
        return dbSqfLite;
      }
    }
    throw ArgumentError('Error create db!');
  }

  Future<Database> database({required String uuid}) async => _database ??= await _initDB(uuid: uuid);

  Future<String> localPath({required String uuid}) async {
    final directory = await getApplicationSupportDirectory();
    final path = '${directory.path}/${uuid}_database.db';
    Logger.print('PathToPhoto:$path');
    return path;
  }

  Future<File> localFile({required String uuid}) async {
    return File(await localPath(uuid: uuid));
  }

  Future<Database> _initDB({required String uuid}) async {
    final path = await localPath(uuid: uuid);
    lastUuid = uuid;
    return await openDatabase(path, version: 1, onCreate: DataBaseSqfLiteImpl.createDB);
  }

  @override
  Future<MonthsCurrentYearEntity?> findAllInYear({required String uuid, required int year}) async {
      try{
        final dbSqlLiteLocal = await dbSqfLite(uuid: uuid);
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
      await _database?.close();
      _database = null;
      final file = await localFile(uuid: uuid);
      await file.delete();
      return true;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete!');
    }
  }

  @override
  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data}) async {
    try{
      final dbSqlLiteLocal = await dbSqfLite(uuid: uuid);
      final id = await dbSqlLiteLocal.insert(data);

      return data.copyWith(id: id);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert month: $e\n$t');
    }
  }

  @override
  Future<bool?> update({required String uuid, required MonthCurrent data}) async {
    try{
      final dbSqlLiteLocal = await dbSqfLite(uuid: uuid);
      final res = await dbSqlLiteLocal.update(data);

      return res>0;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert month: $e\n$t');
    }
  }

}
