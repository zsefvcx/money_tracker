
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class MonthsStatus {

  Future<MonthsCurrentYearEntity?> findAllInYear({required String uuid, required int year});

  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data});

  Future<bool?> delete({required String uuid,});

  Future<bool?> update({required String uuid, required MonthCurrent data});

}
