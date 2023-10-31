
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_expense.g.dart';

///Трата за день
@JsonSerializable()
class DayExpense extends Equatable{
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

  const DayExpense({
    required this.idCategory, required this.dateTime, required this.sum, this.id,
  });

  DayExpense copyWith({
    int? id,
    int? idCategory,
    DateTime? dateTime,
    BigInt? sum,
  }) {
    return DayExpense(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      dateTime: dateTime ?? this.dateTime,
      sum: sum ?? this.sum,
    );
  }

  @override
  List<Object?> get props => [id, idCategory, dateTime, sum];

  /// Connect the generated _$DayExpensesFromJson function to the `fromJson`
  /// factory.
  factory DayExpense.fromJson(Map<String, dynamic> json) => _$DayExpenseFromJson(json);

  /// Connect the generated _$DayExpensesToJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DayExpenseToJson(this);

  @override
  String toString() {
    return 'dayExpenses: {id: $id, idCategory: $idCategory, dateTime: $dateTime, sum: $sum}';
  }

}
