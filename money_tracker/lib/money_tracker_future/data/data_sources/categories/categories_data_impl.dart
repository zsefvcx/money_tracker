
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/money_tracker_future/core/category/category.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';

class CategoriesDataImpl extends CategoriesData {

  final Set<CategoryExpenses> categoriesId = {};

  Set<CategoryExpenses> categoriesIdSort() {
    try {
      final res = categoriesId.map((value) => MapEntry(value.id??-1, value.name));
      final mapCategoriesId = <int, CategoryExpenses>{
        for(final elem in  categoriesId) elem.id??-1 : elem
      };
      final sortedByKeyMap = Map.fromEntries(
          res.toList()
            ..sort((e1, e2) => e1.value.compareTo(e2.value)));

      return sortedByKeyMap.map<int, CategoryExpenses>((key, value) {
        final data = mapCategoriesId[key] ?? (throw Exception('Error search Key'));
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
  Future<CategoriesExpensesModels?> getAllId({required String uuid}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final data = await dbSqlLiteLocal.getAllCategoryId();
      final localData = CategoriesExpensesModels(
          categoriesId: categoriesIdSort()
      );

      if(data != localData){
        Logger.print('Receive new categoriesId');
        if(data!= null) {
          categoriesId..clear()
          ..addAll(data.categoriesId.toList());
        }
        return data;
      }
      return localData;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getAllId Categories: $e\n$t');
    }
  }

  @override
  Future<CategoryExpenses?> getById({required String uuid, required int id}) async {
    try{
      final mapCategoriesId = <int, CategoryExpenses>{
        for(final elem in  categoriesId) elem.id??-1 : elem
      };

      final localCategory = mapCategoriesId[id];
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.getCategoryById(id: id);
      if(localCategory != res){
        categoriesId.remove(localCategory);
        if (res != null) {
          categoriesId.add(res);
        }
        return res;
      }
      return localCategory;
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error getById Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpensesModels?> insert({required String uuid, required CategoryExpenses data}) async{
    try{
      if(categoriesId.length >= 20){
        Logger.print('No more than 20 categories');
      } {
        final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
        final res = await dbSqlLiteLocal.insertCategory(data);
        categoriesId.add(data.copyWith(
          id: res
        ));
      }
      return CategoriesExpensesModels(
          categoriesId: categoriesIdSort()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error insert Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpensesModels?> deleteId({required String uuid, required int id}) async{
    try{
      final mapCategoriesId = <int, CategoryExpenses>{
        for(final elem in  categoriesId) elem.id??-1 : elem
      };

      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.deleteCategory(id);
      if(res > 0) categoriesId.remove(mapCategoriesId[id]);
      return CategoriesExpensesModels(
          categoriesId: categoriesIdSort()
      );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error deleteId Categories: $e\n$t');
    }
  }

  @override
  Future<CategoriesExpensesModels?> update({required String uuid, required CategoryExpenses data}) async {
    try{
      final mapCategoriesId = <int, CategoryExpenses>{
        for(final elem in  categoriesId) elem.id??-1 : elem
      };

      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      final res = await dbSqlLiteLocal.updateCategory(data);
      final id = data.id;
      if(res > 0 && id != null) {
        categoriesId..remove(mapCategoriesId[id])
        ..add(data);
      }
        return CategoriesExpensesModels(
            categoriesId: categoriesIdSort()
        );
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error update Categories: $e\n$t');
    }
  }

  @override
  Future<bool?> check({required String uuid, required CategoryExpenses data}) async {
    try{
      final dbSqlLiteLocal = DataBaseSqfLiteImpl.db(uuid: uuid);
      return await dbSqlLiteLocal.checkCategory(data);
    } on Exception catch(e,t){
      Logger.print('Error $e\n$t', name: 'err', error: true);
      throw ArgumentError('Error check Categories: $e\n$t');
    }
  }

}
