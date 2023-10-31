
import 'package:json_annotation/json_annotation.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/entity.dart';

part 'categories.g.dart';
///Категории
@JsonSerializable()
class CategoriesExpenses extends CategoriesExpensesModels{

  const CategoriesExpenses({required super.completeCategories});

  /// Connect the generated _$CategoriesExpensesFromJson function to the `fromJson`
  /// factory.
  factory CategoriesExpenses.fromJson(Map<String, dynamic> json) => _$CategoriesExpensesFromJson(json);

  /// Connect the generated _$CategoryExpensesToJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoriesExpensesToJson(this);

  @override
  String toString() {
    return 'categoriesExpenses: {$completeCategories}';
  }
}
