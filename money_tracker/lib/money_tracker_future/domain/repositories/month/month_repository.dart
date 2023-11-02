import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class MonthRepository {

  Future<MonthAllowedEntity?> read({required String uuid});

  Future<MonthAllowedEntity?> add({required String uuid, required int month});

  Future<bool?> delete({required String uuid});
}
