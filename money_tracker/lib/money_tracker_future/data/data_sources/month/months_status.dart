
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class MonthsStatus {

  Future<MonthsCurrentYearModel?> findAllInYear({required String uuid, required int year});

  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data});

  Future<bool?> delete({required String uuid,});

}
