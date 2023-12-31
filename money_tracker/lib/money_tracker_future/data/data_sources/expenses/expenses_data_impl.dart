
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/day_expense/day_expense.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class ExpensesDataImpl extends ExpensesData {

  @override
  Future<bool?> delete({required String uuid}) async {
    try {
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      await dbSqlLiteLocal.deleteAll();
      return true;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete all!');
    }
  }

  @override
  Future<bool?> deleteId({required String uuid, required int id}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return (await dbSqlLiteLocal.deleteIdExpenses(id))>0;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error deleteId Expenses: $e\n$t');
    }
  }

  @override
  Future<MonthlyExpensesModel?> getAllByIdMonthCategory({required String uuid, required int idMonth, required int idCategory}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return await dbSqlLiteLocal.getAllByIdMonthCategory(idMonth, idCategory);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getAllByIdMonthCategory: $e\n$t');
    }
  }

  @override
  Future<BigInt?> getTotalInMonthCategory({required String uuid, required int idMonth, required int idCategory}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return await dbSqlLiteLocal.getTotalInMonthCategory(idMonth, idCategory);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getTotalInMonthCategory: $e\n$t');
    }
  }

  @override
  Future<int?> insert({required String uuid, required DayExpense data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return await dbSqlLiteLocal.insertExpenses(data);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert Expenses: $e\n$t');
    }
  }

  @override
  Future<bool?> deleteWithCategory({required String uuid, required int idCategory}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return (await dbSqlLiteLocal.deleteWithCategory(idCategory))>0;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error update Expenses: $e\n$t');
    }
  }

  @override
  Future<Map<int, BigInt>?> readWithMonth({required String uuid, required int idMonth}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return await dbSqlLiteLocal.readWithMonth(idMonth);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error update Expenses: $e\n$t');
    }
  }

  @override
  Future<bool?> update({required String uuid, required DayExpense data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return (await dbSqlLiteLocal.updateExpenses(data))>0;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error update Expenses: $e\n$t');
    }
  }


}
