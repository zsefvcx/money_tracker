import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:money_tracker/entity/category/category.dart';

part 'categories.g.dart';

///Категории
@JsonSerializable()
class CategoriesExpenses  extends Equatable{
  final Map<int, CategoryExpenses> completeCategories;

  const CategoriesExpenses({required this.completeCategories});

  bool status({required int id}) => completeCategories[id]==null?false:true;

  @override
  List<Object?> get props => [completeCategories];

  /// Connect the generated [_$CategoriesExpensesFromJson] function to the `fromJson`
  /// factory.
  factory CategoriesExpenses.fromJson(Map<String, dynamic> json) => _$CategoriesExpensesFromJson(json);

  /// Connect the generated [_$CategoryExpensesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoriesExpensesToJson(this);

  @override
  String toString() {
    return 'categoriesExpenses: {${completeCategories.toString()}}';
  }
}
