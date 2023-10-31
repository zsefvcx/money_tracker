
import 'package:equatable/equatable.dart';

class MonthAllowedModels extends Equatable{
  //Year, Month
  final Map<int, Set<int>> monthEnabled;

  const MonthAllowedModels({required this.monthEnabled});

  @override
  List<Object?> get props => [monthEnabled];

  @override
  String toString() {
    return 'MonthAllowed: {$monthEnabled}';
  }
}
