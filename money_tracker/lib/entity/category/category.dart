import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

///Категория
@JsonSerializable()
class CategoryExpenses extends Equatable{
  final int? id;
  final String name;
  final String colorHex;

  const CategoryExpenses({
    this.id,
    required this.name,
    required this.colorHex,
  });

  CategoryExpenses copyWith({
    int? id,
    String? name,
    String? colorHex,
  }) {
    return CategoryExpenses(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
    );
  }

  @override
  List<Object?> get props => [id,name,colorHex,];

  /// Connect the generated [_$CategoryExpensesFromJson] function to the `fromJson`
  /// factory.
  factory CategoryExpenses.fromJson(Map<String, dynamic> json) => _$CategoryExpensesFromJson(json);

  /// Connect the generated [_$CategoryExpensesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryExpensesToJson(this);

  @override
  String toString() {
    return 'categoryExpenses: {id: $id, name: $name, colorHex: $colorHex}';
  }
}
