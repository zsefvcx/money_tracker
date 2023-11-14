
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class CategoriesDataImpl extends CategoriesData {

  Set<int> categoriesId = {};

  @override
  Future<bool?> delete({required String uuid}) async{
    categoriesId.clear();
    return categoriesId.isEmpty;
  }

  @override
  Future<CategoriesExpenses?> getAllId({required String uuid}) async {
    return CategoriesExpenses(
      categoriesId: categoriesId
    );
  }

  @override
  Future<CategoryExpenses?> getById({required int id}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<CategoryExpenses?> insert({required String uuid, required CategoryExpenses data}) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<bool?> update({required String uuid, required CategoryExpenses data}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}
