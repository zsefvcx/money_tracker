
import 'package:money_tracker/money_tracker_future/core/day_expense/day_expense.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class MonthlyExpensesRepositoryImpl extends MonthlyExpensesRepository {

  ExpensesData expensesData;

  MonthlyExpensesRepositoryImpl({required this.expensesData});

  @override
  Future<bool?> delete({required String uuid}) async {
    return await expensesData.delete(uuid: uuid);
  }

  @override
  Future<bool?> deleteId({required String uuid, required int id}) async {
    return await expensesData.deleteId(uuid: uuid, id: id);
  }

  @override
  Future<MonthlyExpensesEntity?> getAllByIdMonthCategory({required String uuid, required int idMonth, required int idCategory}) async {
    return await expensesData.getAllByIdMonthCategory(uuid: uuid, idMonth: idMonth, idCategory: idCategory);
  }

  @override
  Future<BigInt?> getTotalInMonthCategory({required String uuid, required int idMonth, required int idCategory}) async {
    return await expensesData.getTotalInMonthCategory(uuid: uuid, idMonth: idMonth, idCategory: idCategory);
  }

  @override
  Future<bool?> insert({required String uuid, required DayExpense data}) async {
    return await expensesData.insert(uuid: uuid, data: data);
  }

  @override
  Future<bool?> deleteWithCategory({required String uuid, required int idCategory}) async {
    return await expensesData.deleteWithCategory(uuid: uuid, idCategory: idCategory);
  }

  @override
  Future<MonthlyExpensesEntity?> readWithMonth({required String uuid, required int idMonth}) async {
    return await expensesData.readWithMonth(uuid: uuid, idMonth: idMonth);
  }


}
