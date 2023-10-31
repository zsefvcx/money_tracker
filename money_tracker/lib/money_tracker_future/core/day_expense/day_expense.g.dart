// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayExpense _$DayExpenseFromJson(Map<String, dynamic> json) => DayExpense(
      idCategory: json['idCategory'] as int,
      dateTime: DateTime.parse(json['dateTime'] as String),
      sum: BigInt.parse(json['sum'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DayExpenseToJson(DayExpense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCategory': instance.idCategory,
      'dateTime': instance.dateTime.toIso8601String(),
      'sum': instance.sum.toString(),
    };
