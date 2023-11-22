import 'package:money_tracker/core/logger/logger.dart';
import 'package:money_tracker/money_tracker_future/core/month/month_current.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class MonthsStatusImpl extends MonthsStatus {

  @override
  Future<MonthsCurrentYearModel?> findAllInYear({required String uuid, required int year}) async {
      try{
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
          final data = await dbSqlLiteLocal.findAllMonthInYear(year);
          final monthsCurrentYear = MonthsCurrentYearModel(
            uuid: uuid,
            year: year,
            months: data.toSet(),
          );
          return monthsCurrentYear;
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
      return true;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete all!');
    }
  }

  @override
  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final id = await dbSqlLiteLocal.insertMonth(data);

      return data.copyWithId(id: id);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert month: $e\n$t');
    }
  }

}
