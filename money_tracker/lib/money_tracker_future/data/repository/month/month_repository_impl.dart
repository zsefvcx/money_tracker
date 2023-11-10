

import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class MonthRepositoryImpl extends MonthRepository {

  final MonthsStatus monthsStatus;

  MonthRepositoryImpl({required this.monthsStatus});

  @override
  Future<bool?> delete({required String uuid, required MonthCurrent data}) async {
    return await monthsStatus.delete(uuid: uuid, data: data);
  }

  @override
  Future<bool?> update({required String uuid, required MonthCurrent data}) async {
    return await monthsStatus.update(uuid: uuid, data: data);
  }

  @override
  Future<MonthsCurrentYearEntity?> findAllInYear({required String uuid, required int year}) async {
    return await monthsStatus.findAllInYear(uuid: uuid, year: year);
  }

  @override
  Future<MonthCurrent?> insert({required String uuid, required int year, required int month}) async {
    return await monthsStatus.insert(uuid: uuid, year: year, month: month);
  }
}
