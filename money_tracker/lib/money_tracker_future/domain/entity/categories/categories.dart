import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

///Категории
abstract class CategoriesExpensesModels  extends Equatable{
  final Set<CategoryExpenses> categoriesId;

  const CategoriesExpensesModels({required this.categoriesId});

  @override
  List<Object?> get props => [categoriesId];

  @override
  String toString() {
    return 'categoriesExpenses: {$categoriesId}';
  }
}
