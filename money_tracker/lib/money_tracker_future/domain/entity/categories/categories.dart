import 'package:equatable/equatable.dart';

///Категории
abstract class CategoriesExpensesModels  extends Equatable{
  final Set<int> categoriesId;

  const CategoriesExpensesModels({required this.categoriesId});

  @override
  List<Object?> get props => [categoriesId];

  @override
  String toString() {
    return 'categoriesExpenses: {$categoriesId}';
  }
}
