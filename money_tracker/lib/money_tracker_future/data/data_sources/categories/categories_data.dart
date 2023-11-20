
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

abstract class CategoriesData {

  Future<CategoriesExpenses?> insert({required String uuid, required CategoryExpenses data});

  Future<CategoriesExpenses?> getAllId({required String uuid});

  Future<CategoryExpenses?> getById({required String uuid, required int id});

  Future<bool?> delete({required String uuid});

  Future<CategoriesExpenses?> update({required String uuid, required CategoryExpenses data});

  Future<bool?> check({required String uuid, required CategoryExpenses data});

  Future<CategoriesExpenses?> deleteId({required String uuid, required int id});
}
