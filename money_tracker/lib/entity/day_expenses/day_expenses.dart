
import 'package:money_tracker/entity/entity.dart';

class DayExpenses {
  final int? id;
  final int  idCategory;
  final DateTime dateTime;
  final BigInt sum;  //1/100 + 1/1000

  (int, int, int) get param => (dateTime.day, dateTime.month, dateTime.year);

//<editor-fold desc="Data Methods">
  const DayExpenses({
    this.id,
    required this.idCategory,
    required this.dateTime,
    required this.sum,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is DayExpenses &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              idCategory == other.idCategory &&
              dateTime == other.dateTime &&
              sum == other.sum
          );

  @override
  int get hashCode =>
      id.hashCode ^
      idCategory.hashCode ^
      dateTime.hashCode ^
      sum.hashCode;


  @override
  String toString() {
    return 'DayExpenses{ id: $id, idCategory: $idCategory, dateTime: $dateTime, sum: $sum,}';
  }

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


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idCategory': idCategory,
      'dateTime': dateTime.toString(),
      'sum': sum.toString(),
    };
  }

  factory DayExpenses.fromMap(Map<String, dynamic> map) {
    return DayExpenses(
      id: map['id'] as int,
      idCategory: map['idCategory'] as int,
      dateTime: DateTime.parse (map['dateTime'] as String),
      sum: BigInt.parse(map['sum'] as String),
    );
  }


  //</editor-fold>
}
