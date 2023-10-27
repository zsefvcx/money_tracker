// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesExpenses _$CategoriesExpensesFromJson(Map<String, dynamic> json) =>
    CategoriesExpenses(
      completeCategories:
          (json['completeCategories'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), CategoryExpenses.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CategoriesExpensesToJson(CategoriesExpenses instance) =>
    <String, dynamic>{
      'completeCategories':
          instance.completeCategories.map((k, e) => MapEntry(k.toString(), e)),
    };
