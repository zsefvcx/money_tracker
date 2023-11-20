import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/data/data.dart';
import 'package:sqflite/sqflite.dart'
        if(dart.library.io.Platform.isWindows)'package:sqflite_common_ffi/sqflite_ffi.dart'
        if(dart.library.io.Platform.isLinux  )'package:sqflite_common_ffi/sqflite_ffi.dart';

abstract class DataBaseCategorySqfLite {
  Future<CategoriesExpenses?> getAllCategoryId();
  Future<CategoryExpenses?> getCategoryById({required int id});
  Future<int> insertCategory(CategoryExpenses data, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
  });
  Future<int> deleteCategory(int id);

  Future<bool> checkCategory(CategoryExpenses data);
  Future<int> updateCategory(CategoryExpenses data,
      {
        ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
      });
}

abstract class DataBaseMonthSqfLite {
  Future<List<int>> findAllMonthInYear(int year);
  Future<MonthCurrent?> findMonthById(int id);
  Future<int> insertMonth(MonthCurrent data, {
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore
  });
  Future<int> deleteMonth(int id);
}
