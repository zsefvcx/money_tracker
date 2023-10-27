// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayExpenses _$DayExpensesFromJson(Map<String, dynamic> json) => DayExpenses(
      id: json['id'] as int?,
      idCategory: json['idCategory'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      sum: BigInt.parse(json['sum'] as String),
    );

Map<String, dynamic> _$DayExpensesToJson(DayExpenses instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCategory': instance.idCategory,
      'dateTime': instance.dateTime.toIso8601String(),
      'sum': instance.sum.toString(),
    };
