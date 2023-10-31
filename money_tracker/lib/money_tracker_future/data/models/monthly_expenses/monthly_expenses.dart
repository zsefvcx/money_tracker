
import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class MonthlyExpensesModels extends Equatable{
  final int month;
  final int year;
  //|категория
  //|      //|день
  //|        |      //|id траты
  final Map<int, Map<int, Map<int, DayExpense>>> completeExpenses;

  const MonthlyExpensesModels({
    required this.month,
    required this.year,
    required this.completeExpenses,
  });

  @override
  List<Object?> get props => [month, year, completeExpenses];

  @override
  String toString() {
    return 'monthlyExpenses: {month: $month, year: $year MonthlyExpenses: $completeExpenses}';
  }
}
