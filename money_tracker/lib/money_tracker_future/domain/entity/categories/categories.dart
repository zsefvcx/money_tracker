import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

///Категории
abstract class CategoriesExpensesModels  extends Equatable{
  final Map<int, CategoryExpenses> completeCategories;

  const CategoriesExpensesModels({required this.completeCategories});

  bool status({required int id}) {
    if (completeCategories[id]==null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  List<Object?> get props => [completeCategories];

  @override
  String toString() {
    return 'categoriesExpenses: {$completeCategories}';
  }
}
