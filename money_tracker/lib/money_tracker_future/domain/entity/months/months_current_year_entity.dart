
import 'package:equatable/equatable.dart';

abstract class MonthsCurrentYearEntity extends Equatable{

  final String uuid;
  final int year;
  final Set<int> months;

  const MonthsCurrentYearEntity({
    required this.uuid,
    required this.year,
    required this.months
  });


  @override
  List<Object?> get props => [year, months];

  @override
  String toString() {
    return 'MonthAllowed: {$year, $months}';
  }
}
