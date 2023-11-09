
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class MonthCurrent extends Equatable {
  @primaryKey
  final int? id;

  final int year;
  final int month;

  const MonthCurrent({required this.id, required this.year, required this.month});

  MonthCurrent copyWith({
    int? id,
    int? year,
    int? month,
  }) {
    return MonthCurrent(
      id: id ?? this.id,
      year: year ?? this.year,
      month: month ?? this.month,
    );
  }

  @override
  List<Object?> get props => [id, year, month];

  @override
  String toString() {
    return 'MonthEnable: {$id, $year, $month}';
  }
}
