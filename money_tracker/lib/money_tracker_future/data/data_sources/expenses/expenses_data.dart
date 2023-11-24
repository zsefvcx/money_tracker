import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class ExpensesData {

  Future<bool?> insert({
    required String uuid,
    required DayExpense data
  });

  Future<BigInt?> getTotalInMonthCategory({
    required String uuid,
    required int idMonth,
    required int idCategory,
  });

  Future<MonthlyExpensesModel?> getAllByIdMonthCategory({
    required String uuid,
    required int idMonth,
    required int idCategory,
  });

  Future<bool?> deleteWithCategory({
    required String uuid,
    required int idCategory,
  });

  Future<MonthlyExpensesModel?> readWithMonth({
    required String uuid,
    required int idMonth,
  });

  Future<bool?> delete({required String uuid});

  Future<bool?> deleteId({required String uuid, required int id});

  Future<MonthlyExpensesModel?> update({
    required String uuid,
    required DayExpense data
  });

  Future<bool?> check({required String uuid, required DayExpense data});

  Future<DayExpense?> getById({required String uuid, required int id});
}
