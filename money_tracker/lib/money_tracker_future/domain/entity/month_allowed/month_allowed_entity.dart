
import 'package:equatable/equatable.dart';

abstract class MonthAllowedEntity extends Equatable{
  //Year, Month
  final Map<int, Set<int>> monthEnabled;

  const MonthAllowedEntity({required this.monthEnabled});

  @override
  List<Object?> get props => [monthEnabled];

  @override
  String toString() {
    return 'MonthAllowed: {$monthEnabled}';
  }
}
