import 'package:money_tracker/entity/category/category.dart';

class CategoriesExpenses {
  final Map<int, CategoryExpenses> completeCategories = {};

  CategoriesExpenses();

  @override
  String toString() {
    return 'CategoriesExpenses{${completeCategories.toString()}}';
  }

}
