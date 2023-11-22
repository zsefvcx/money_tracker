
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class CategoriesRepository {

  Future<CategoriesExpensesEntity?> insert({required String uuid, required CategoryExpenses data});

  Future<CategoriesExpensesEntity?> getAllId({required String uuid});

  Future<CategoryExpenses?> getById({required String uuid, required int id});

  Future<bool?> delete({required String uuid});

  Future<CategoriesExpensesEntity?> update({required String uuid, required CategoryExpenses data});

  Future<bool?> check({required String uuid, required CategoryExpenses data});

  Future<CategoriesExpensesEntity?> deleteId({required String uuid, required int id});

}
