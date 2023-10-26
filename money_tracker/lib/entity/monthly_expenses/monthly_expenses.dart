import 'package:money_tracker/entity/entity.dart';

///РасходыЗаМесяц
class MonthlyExpenses {
  final int _month;
  final int _year;
  final Map<int, Map<int, Set<DayExpenses>>> _completeExpenses = {};

  (int, int) get param => (_month, _year);

  MonthlyExpenses({
    required int month,
    required int year,
  }) : _year = year, _month = month;

  bool add(DayExpenses value){
    if(!(   _month == value.dateTime.month
         && _year == value.dateTime.year)) return false;

    final status = _completeExpenses[value.idCategory];
    final day = value.dateTime.day;

    if(status == null) {//нет вообще категорий
      _completeExpenses[value.idCategory] = <int, Set<DayExpenses>>{day: {value}};//добавляем элемент в категорию
    } else {//есть категория
      final status2  = status[day];
      if(status2 == null){//проверяем наличие такого элемента с таким днем
        _completeExpenses[value.idCategory] = <int, Set<DayExpenses>>{day: {value}};//добавляем эелмент в категорию
      } else {
        status2.add(value);
        //completeExpenses[value.idCategory]![day]!.add(value);
      }
    }
    return true;
  }

  void rem({int? idCategory, int? id,}){
    if (id != null && idCategory != null){
      _completeExpenses.clear();
    } else if(idCategory != null){
      _completeExpenses.remove(idCategory);
    } else if(id != null){
      _completeExpenses.values.toList().forEach((element) =>
        element.values
      );
    }

  }

  int get length  => _completeExpenses.length;

  BigInt? totalSum(int idCategory) =>
      _completeExpenses[idCategory]?.values.toList()
             .fold<BigInt>(BigInt.from(0),(previousValue, element) =>
      element.fold<BigInt>(previousValue, (previousValue, element) =>
      previousValue+element.sum));

  @override
  String toString() {
    return '$_month:$_year:MonthlyExpenses{${_completeExpenses.toString()}}';
  }
}
