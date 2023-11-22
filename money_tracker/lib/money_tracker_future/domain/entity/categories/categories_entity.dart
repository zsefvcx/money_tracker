import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

///Категории
abstract class CategoriesExpensesEntity  extends Equatable{
  final Set<CategoryExpenses> categoriesId;

  const CategoriesExpensesEntity({required this.categoriesId});

  @override
  List<Object?> get props => [categoriesId];

  @override
  String toString() {
    return 'categoriesExpenses: {$categoriesId}';
  }
}
