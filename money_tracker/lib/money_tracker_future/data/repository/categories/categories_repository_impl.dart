
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class CategoriesRepositoryImpl extends CategoriesRepository{

  CategoriesData categoriesData;

  CategoriesRepositoryImpl({required this.categoriesData});

  @override
  Future<bool?> delete({required String uuid}) async {
    return categoriesData.delete(uuid: uuid);
  }

  @override
  Future<CategoriesExpensesEntity?> getAllId({required String uuid}) async {
    return categoriesData.getAllId(uuid: uuid);
  }

  @override
  Future<CategoriesExpensesEntity?> insert({required String uuid, required CategoryExpenses data}) async {
    return categoriesData.insert(uuid: uuid, data: data);
  }

  @override
  Future<CategoryExpenses?> getById({required String uuid, required int id}) async {
    return categoriesData.getById(uuid: uuid, id: id);
  }

  @override
  Future<CategoriesExpensesEntity?> deleteId({required String uuid, required int id}) async {
    return categoriesData.deleteId(uuid: uuid,id: id);
  }

  @override
  Future<CategoriesExpensesEntity?> update({required String uuid, required CategoryExpenses data}) async {
    return categoriesData.update(uuid: uuid, data: data);
  }

  @override
  Future<bool?> check({required String uuid, required CategoryExpenses data}) async {
    return categoriesData.check(uuid: uuid, data: data);
  }

}
