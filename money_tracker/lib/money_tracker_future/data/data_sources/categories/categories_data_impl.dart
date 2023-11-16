
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class CategoriesDataImpl extends CategoriesData {

  final Map<int, CategoryExpenses> categoriesId = {};

  @override
  Future<bool?> delete({required String uuid}) async{
    try {
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      await dbSqlLiteLocal.deleteAll();
      categoriesId.clear();
      return categoriesId.isEmpty;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete!');
    }
  }

  @override
  Future<CategoriesExpenses?> getAllId({required String uuid}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.getAllCategoryId();
      if(res != null){
        for (final element in res.categoriesId) {
          final id = element.id;
          if(id!=null)categoriesId.putIfAbsent(id, () => element);
        }
      }
      return CategoriesExpenses(
          categoriesId: categoriesId.values.toSet()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error findAllInYear month: $e\n$t');
    }
  }

  @override
  Future<CategoryExpenses?> getById({required String uuid, required int id}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.getCategoryById(id: id);
      if(res != null){
          final id = res.id;
          if(id!=null)categoriesId.putIfAbsent(id, () => res);
      }
      return categoriesId[id];
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error findAllInYear month: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpenses?> insert({required String uuid, required CategoryExpenses data}) async{
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.insertCategory(data);
      categoriesId.putIfAbsent(res, () => data.copyWith(id: res));
      return CategoriesExpenses(
          categoriesId: categoriesId.values.toSet()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error findAllInYear month: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpenses?> deleteId({required String uuid, required int id}) async{
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.deleteCategory(id);
      if(res > 0) categoriesId.remove(id);
      return CategoriesExpenses(
          categoriesId: categoriesId.values.toSet()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error findAllInYear month: $e\n$t');
    }
  }

}
