
import 'package:equatable/equatable.dart';

class MonthCurrent extends Equatable {
  final int? id;
  final int year;
  final int month;

  const MonthCurrent({required this.id, required this.year, required this.month});

  MonthCurrent copyWithId({
    required int? id,
    int? year,
    int? month,
  }) {
    return MonthCurrent(
      id: id,
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'year': year,
      'month': month,
    };
  }

  factory MonthCurrent.fromJson(Map<String, dynamic> map) {
    return MonthCurrent(
      id: map['id'] as int?,
      year: map['year'] as int,
      month: map['month'] as int,
    );
  }
}
