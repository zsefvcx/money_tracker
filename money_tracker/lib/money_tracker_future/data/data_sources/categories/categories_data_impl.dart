
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class CategoriesDataImpl extends CategoriesData {

  final Map<int, CategoryExpenses> categoriesId = {};

  Set<CategoryExpenses> categoriesIdSort() {
    try {
      final res = categoriesId.map((key, value) => MapEntry(key, value.name));

      final sortedByKeyMap = Map.fromEntries(
          res.entries.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));

      return sortedByKeyMap.map<int, CategoryExpenses>((key, value) {
        final data = categoriesId[key] ?? (throw Exception('Error search Key'));
        return MapEntry(key, data);
      }).values.toSet();
    } on Exception catch(e, t){
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error categoriesIdSort!');
    }
  }
  
  
  @override
  Future<bool?> delete({required String uuid}) async{
    try {
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      await dbSqlLiteLocal.deleteAll();
      categoriesId.clear();
      return categoriesId.isEmpty;
    } on Exception catch (e, t) {
      Logger.print('$e\n$t', name: 'err', level: 1, error: true);
      throw ArgumentError('Error delete all!');
    }
  }

  @override
  Future<CategoriesExpenses?> getAllId({required String uuid}) async {
    try{
      if(categoriesId.isEmpty){
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
        final res = await dbSqlLiteLocal.getAllCategoryId();
        if(res != null){
          categoriesId.addAll(Map.fromEntries(
            res.categoriesId.map((e) {
              final id = e.id ?? (throw Exception('Error id'));
              return MapEntry(id, e);
            })
          )
          );
        }
      }
      return CategoriesExpenses(
          categoriesId: categoriesId.values.toSet()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getAllId Categories: $e\n$t');
    }
  }

  @override
  Future<CategoryExpenses?> getById({required String uuid, required int id}) async {
    try{
      final localCategory = categoriesId[id];
      if(localCategory == null){
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
        final res = await dbSqlLiteLocal.getCategoryById(id: id);
        if(res != null){
            final id = res.id;
            if(id!=null)categoriesId.putIfAbsent(id, () => res);
        }
      }
      return categoriesId[id];
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getById Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpenses?> insert({required String uuid, required CategoryExpenses data}) async{
    try{
      if(categoriesId.length >= 20){
        Logger.print('No more than 20 categories');
      } {
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
        final res = await dbSqlLiteLocal.insertCategory(data);
        categoriesId.putIfAbsent(res, () => data.copyWith(id: res));
      }


      return CategoriesExpenses(
          categoriesId: categoriesIdSort()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpenses?> deleteId({required String uuid, required int id}) async{
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.deleteCategory(id);
      if(res > 0) categoriesId.remove(id);
      return CategoriesExpenses(
          categoriesId: categoriesIdSort()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error deleteId Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpenses?> update({required String uuid, required CategoryExpenses data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.updateCategory(data);
      final id = data.id;
      if(res > 0 && id != null) categoriesId[id] = data;
      return CategoriesExpenses(
          categoriesId: categoriesIdSort()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error update Categories: $e\n$t');
    }
  }

}
