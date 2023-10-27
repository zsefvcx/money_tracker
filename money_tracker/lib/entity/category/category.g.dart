// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryExpenses _$CategoryExpensesFromJson(Map<String, dynamic> json) =>
    CategoryExpenses(
      id: json['id'] as int?,
      name: json['name'] as String,
      colorHex: json['colorHex'] as String,
    );

Map<String, dynamic> _$CategoryExpensesToJson(CategoryExpenses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'colorHex': instance.colorHex,
    };
