
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_expenses.g.dart';

///Траты за день
@JsonSerializable()
class DayExpenses extends Equatable{
  final int? id;
  final int  idCategory;
  final DateTime dateTime;
  final BigInt sum;  //1/100 + 1/1000

  int get day => dateTime.day;
  int get month => dateTime.month;
  int get year => dateTime.year;
  String get time => '${dateTime.hour<10?'0${dateTime.hour}':dateTime.hour}'
                ':${dateTime.minute<10?'0${dateTime.minute}':dateTime.minute}';
  (int, int, int) get param => (dateTime.day, dateTime.month, dateTime.year);

  const DayExpenses({
    required this.idCategory, required this.dateTime, required this.sum, this.id,
  });

  DayExpenses copyWith({
    int? id,
    int? idCategory,
    DateTime? dateTime,
    BigInt? sum,
  }) {
    return DayExpenses(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      dateTime: dateTime ?? this.dateTime,
      sum: sum ?? this.sum,
    );
  }

  @override
  List<Object?> get props => [id, idCategory, dateTime, sum];

  /// Connect the generated [_$DayExpensesFromJson] function to the `fromJson`
  /// factory.
  factory DayExpenses.fromJson(Map<String, dynamic> json) => _$DayExpensesFromJson(json);

  /// Connect the generated [_$DayExpensesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DayExpensesToJson(this);

  @override
  String toString() {
    return 'dayExpenses: {id: $id, idCategory: $idCategory, dateTime: $dateTime, sum: $sum}';
  }

}
