
import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class MonthlyExpensesEntity extends Equatable{

  final Set<DayExpense> completeExpenses;

  const MonthlyExpensesEntity({
    required this.completeExpenses,
  });

  @override
  List<Object?> get props => [completeExpenses];

  @override
  String toString() {
    return 'monthlyExpenses: {completeExpenses: $completeExpenses}';
  }
}
