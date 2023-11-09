
import 'dart:io';

import 'package:money_tracker/core/logger/logger.dart';
import 'package:money_tracker/money_tracker_future/core/month/month_current.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class MonthsStatusImpl extends MonthsStatus {

  MonthEnableDao? dao;

  Future<void> _initDataBaseFloor({required String uuid}) async {
    final database = await $FloorAppDatabase
        .databaseBuilder('${uuid}_database.db')
        .build();
    dao = database.monthEnableDao;
  }

  @override
  Future<MonthCurrent> insert({required String uuid, required int year, required int month}) async {
    try{
        if(dao == null) await _initDataBaseFloor(uuid: uuid);
        final daoLocal = dao;
        if(daoLocal !=null) {
          final monthCurrent = MonthCurrent(id: null, year: year, month: month);
          final id = await daoLocal.insertMonth(monthCurrent);
          return monthCurrent.copyWith(
            id: id,
          );
        }
      throw ArgumentError('Error insert month');
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<bool?> delete({required String uuid, required MonthCurrent data}) async {
    try{
      if(dao == null) await _initDataBaseFloor(uuid: uuid);
      final daoLocal = dao;
      if(daoLocal !=null) {
        final id = await daoLocal.deleteMonth(data);
        if (id>0) {
          return true;
        } else {
          return false;
        }
      }
      throw ArgumentError('Error insert month');
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<bool?> update({required String uuid, required MonthCurrent data}) async {
    try{
      if(dao == null) await _initDataBaseFloor(uuid: uuid);
      final daoLocal = dao;
      if(daoLocal !=null) {
        final id = await daoLocal.deleteMonth(data);
        if (id>0) {
          return true;
        } else {
          return false;
        }
      }
      throw ArgumentError('Error insert month');
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }

  @override
  Future<MonthsCurrentYearEntity> findAllInYear({required String uuid, required int year}) async {
    try{
      if(dao == null) await _initDataBaseFloor(uuid: uuid);
      final daoLocal = dao;
      if(daoLocal !=null) {
        final data = await daoLocal.findAllMonthInYear(year);
        final monthsCurrentYearEntity = MonthsCurrentYearModel(
          uuid: uuid,
          year: year,
          months: data.toSet(),
        );
        return monthsCurrentYearEntity;
      }
      throw ArgumentError('Error insert month');
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insertGroup: $e\n$t');
    }
  }
}
