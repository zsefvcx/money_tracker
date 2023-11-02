
import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class MonthsStatus {

  Future<MonthAllowedModel?> read({required String uuid});

  Future<MonthAllowedModel?> add({required String uuid, required int month});

  Future<bool?> delete({required String uuid});

}
