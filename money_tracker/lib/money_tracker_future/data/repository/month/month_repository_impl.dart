

import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class MonthRepositoryImpl extends MonthRepository {

  final MonthsStatus monthsStatus;

  MonthRepositoryImpl({required this.monthsStatus});

  @override
  Future<bool?> delete({required String uuid}) async {
    return monthsStatus.delete(uuid: uuid);
  }

  @override
  Future<MonthsCurrentYearEntity?> findAllInYear({required String uuid, required int year}) async {
    return monthsStatus.findAllInYear(uuid: uuid, year: year);
  }

  @override
  Future<MonthCurrent?> insert({required String uuid, required MonthCurrent data}) async {
    return monthsStatus.insert(uuid: uuid, data: data);
  }
}
