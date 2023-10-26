import 'package:money_tracker/entity/entity.dart';

///Расходы по годам
class YearExpenses{
  final Map<(int, int), MonthlyExpenses> completeExpense = {};

  YearExpenses();

  @override
  String toString() {
    return 'YearExpenses{${completeExpense.toString()}}';
  }
}
