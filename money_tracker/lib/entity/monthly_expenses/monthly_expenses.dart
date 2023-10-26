import 'package:money_tracker/entity/entity.dart';

///РасходыЗаМесяц
class MonthlyExpenses {
  final int _month;
  final int _year;
  final Map<int, Map<int, Set<DayExpenses>>> completeExpenses = {};

  (int, int) get param => (_month, _year);

  MonthlyExpenses({
    required int month,
    required int year,
  }) : _year = year, _month = month;

  bool add(DayExpenses value){
    if(!(   _month == value.dateTime.month
         && _year == value.dateTime.year)) return false;

    final status = completeExpenses[value.idCategory];
    final day = value.dateTime.day;

    if(status == null) {//нет вообще категорий
      completeExpenses[value.idCategory] = <int, Set<DayExpenses>>{day: [value]};//добавляем элемент в категорию
      return true;
    } else {//есть категория
      final status2  = status[day];
      if(status2 == null){//проверяем наличие такого элемента с таким днем
        completeExpenses[value.idCategory] = <int, [DayExpenses]>{day: [value]};//добавляем эелмент в категорию
        return true;
      } else {
        completeExpenses[value.idCategory]![day];

      }

    }
    return false;
  }

  @override
  String toString() {
    return '$_month:$_year:MonthlyExpenses{${completeExpenses.toString()}}';
  }
}
