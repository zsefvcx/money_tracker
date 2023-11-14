// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesExpenses _$CategoriesExpensesFromJson(Map<String, dynamic> json) =>
    CategoriesExpenses(
      categoriesId:
          (json['categoriesId'] as List<dynamic>).map((e) => e as int).toSet(),
    );

Map<String, dynamic> _$CategoriesExpensesToJson(CategoriesExpenses instance) =>
    <String, dynamic>{
      'categoriesId': instance.categoriesId.toList(),
    };
