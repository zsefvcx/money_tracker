
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class MonthRepositoryImpl extends MonthRepository {

  final MonthsStatus monthsStatus;

  MonthRepositoryImpl({required this.monthsStatus});

  @override
  Future<MonthAllowedEntity?> read({required String uuid}) async {
    return await monthsStatus.read(uuid: uuid);
  }

  @override
  Future<MonthAllowedEntity?> add({required String uuid, required int month}) async {
    return await monthsStatus.add(uuid: uuid, month: month);
  }

  @override
  Future<bool?> delete({required String uuid}) async {
    return await monthsStatus.delete(uuid: uuid);
  }

}
