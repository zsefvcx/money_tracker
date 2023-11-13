
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:money_tracker/money_tracker_future/domain/domain.dart';

class CategoriesImpl extends CategoriesRepository{

  CategoriesData categoriesData;

  CategoriesImpl(this.categoriesData);

  @override
  Future<bool?> delete({required String uuid}) async {
    return await categoriesData.delete(uuid: uuid);
  }

  @override
  Future<int?> getLength({required String uuid}) async {
    return await categoriesData.getLength(uuid: uuid);
  }

  @override
  Future<CategoryExpenses?> insert({required String uuid, required CategoryExpenses data}) async {
    return await categoriesData.insert(uuid: uuid, data: data);
  }

  @override
  Future<bool?> update({required String uuid, required CategoryExpenses data}) async {
    return await categoriesData.update(uuid: uuid, data: data);
  }

}
