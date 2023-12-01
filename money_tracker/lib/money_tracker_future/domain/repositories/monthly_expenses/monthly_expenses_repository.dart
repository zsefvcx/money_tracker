
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class MonthlyExpensesRepository {

  Future<int?> insert({
    required String uuid,
    required DayExpense data
  });

  Future<BigInt?> getTotalInMonthCategory({
    required String uuid,
    required int idMonth,
    required int idCategory,
  });

  Future<bool?> deleteWithCategory({
    required String uuid,
    required int idCategory,
  });

  Future<MonthlyExpensesEntity?> getAllByIdMonthCategory({
    required String uuid,
    required int idMonth,
    required int idCategory,
  });

  Future<Map<int, BigInt>?> readWithMonth({
    required String uuid,
    required int idMonth,
  });

  Future<bool?> delete({required String uuid});

  Future<bool?> deleteId({required String uuid, required int id});

  Future<bool?> update({required String uuid, required DayExpense data});
}
