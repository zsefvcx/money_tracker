
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

abstract class CategoriesRepository {

  Future<CategoriesExpensesModels?> insert({required String uuid, required CategoryExpenses data});

  Future<CategoriesExpensesModels?> getAllId({required String uuid});

  Future<CategoryExpenses?> getById({required int id});

  Future<bool?> delete({required String uuid});

  Future<bool?> update({required String uuid, required CategoryExpenses data});

}
