// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_expenses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthlyExpenses _$MonthlyExpensesFromJson(Map<String, dynamic> json) =>
    MonthlyExpenses(
      month: json['month'] as int,
      year: json['year'] as int,
      completeExpenses: (json['completeExpenses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as Map<String, dynamic>).map(
              (k, e) => MapEntry(
                  int.parse(k),
                  (e as Map<String, dynamic>).map(
                    (k, e) => MapEntry(int.parse(k),
                        DayExpenses.fromJson(e as Map<String, dynamic>)),
                  )),
            )),
      ),
    );

Map<String, dynamic> _$MonthlyExpensesToJson(MonthlyExpenses instance) =>
    <String, dynamic>{
      'month': instance.month,
      'year': instance.year,
      'completeExpenses': instance.completeExpenses.map((k, e) => MapEntry(
          k.toString(),
          e.map((k, e) => MapEntry(
              k.toString(), e.map((k, e) => MapEntry(k.toString(), e)))))),
    };
