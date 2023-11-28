import 'package:equatable/equatable.dart';
import 'package:money_tracker/core/core.dart';

///Трата за день
class DayExpense extends Equatable{
  final int? id;
  final int  idCategory;
  final int  idMonth;
  final DateTime  dateTime;
  final BigInt sum;  //1/100 + 1/1000

  const DayExpense({
    required this.idCategory,
    required this.idMonth,
    required this.dateTime,
    required this.sum,
    this.id,
  });

  DayExpense copyWith({
    int? id,
    int? idCategory,
    int? idMonth,
    DateTime? dateTime,
    BigInt? sum,
  }) {
    return DayExpense(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      idMonth: idMonth ?? this.idMonth,
      dateTime: dateTime ?? this.dateTime,
      sum: sum ?? this.sum,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idCategory': idCategory,
      'idMonth': idMonth,
      'dateTime': dateTime.toString(),
      'sum': sum.toString(),
    };
  }

  factory DayExpense.fromJson(Map<String, dynamic> map) {
    return DayExpense(
      id: map['id'] as int,
      idCategory: map['idCategory'] as int,
      idMonth: map['idMonth'] as int,
      dateTime: DateTime.parse(map['dateTime'] as String),
      sum: BigInt.parse(map['sum'] as String),
    );
  }

  @override
  List<Object?> get props => [id, idCategory, idMonth, dateTime, sum];

  @override
  String toString() {
    return 'dayExpenses: {id: $id, idCategory: $idCategory, idMonth: $idMonth, data: $dateTime, sum: $sum}';
  }
}
