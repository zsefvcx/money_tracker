import 'package:json_annotation/json_annotation.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/entity.dart';

part 'monthly_expenses.g.dart';

///РасходыЗаМесяц
///Загружать из памяти
@JsonSerializable()
class MonthlyExpenses extends MonthlyExpensesModels{

  (int, int) get param => (month, year);
  //test
  int get length => completeExpenses.values
      .fold<int>(0, (prevValue, dataCategory) => dataCategory.values
      .fold(prevValue, (prevValue, dataDay) => prevValue+dataDay.length
  ));

  const MonthlyExpenses({
    required super.month,
    required super.year,
    required super.completeExpenses,
  });

  bool checkDayExpenses(int month, int year) {
    return month==this.month&&year==this.year;
  }

  bool statusCategory({required int idCategory}) {
    final status = completeExpenses[idCategory];
    if(status == null) {
      return false;
    } else {
      return true;
    }
  }

  bool status(DayExpense value){
    if(!checkDayExpenses(value.dateTime.month, value.dateTime.year)) return false;

    final id = value.id;
    if(id == null) return false;

    final status = completeExpenses[value.idCategory];
    final day = value.dateTime.day;

    if(status == null){
      return false;
    } else {
      final status2  = status[day];
      if(status2 == null){
        return false;
      }else {
        final status3 = status2[id];
        if (status3 == null){
          return false;
        }
      }
    }
    return true;
  }

  bool mod(DayExpense value) => add(value);

  bool add(DayExpense value){
    if(!checkDayExpenses(value.dateTime.month, value.dateTime.year)) return false;

    final id = value.id;
    if(id == null) return false;

    final status = completeExpenses[value.idCategory];
    final day = value.dateTime.day;

    if(status == null) {//нет вообще категорий
      completeExpenses[value.idCategory] = <int, Map<int, DayExpense>>{day: {id: value}};//добавляем элемент в категорию
    } else {//есть категория
      final status2  = status[day];
      if(status2 == null){//проверяем наличие такого элемента с таким днем
        completeExpenses[value.idCategory] = <int, Map<int, DayExpense>>{day: {id: value}};//добавляем эелмент в категорию
      } else {
        status2[id] = value;
      }
    }
    return true;
  }

  void remDataCategory({required int idCategory}) => completeExpenses.remove(idCategory);

  void remAll() => completeExpenses.clear();

  void rem({required DayExpense value}){
    if(!checkDayExpenses(value.dateTime.month, value.dateTime.year)) return;
    final dataCategory = completeExpenses[value.idCategory];
    if(dataCategory != null){
      final dataDay = dataCategory[value.day];
      if(dataDay != null){
        dataDay.remove(value.id);
      }
    }
  }

  BigInt totalSumCategory(int idCategory) =>
      completeExpenses[idCategory]?.values
             .fold<BigInt>(BigInt.from(0),(previousValue, dataCategory) =>
          dataCategory.values.fold<BigInt>(previousValue, (previousValue, dataDay) =>
          previousValue + dataDay.sum))??BigInt.from(0);

  BigInt totalSumCategoryDay(int idCategory, int day) =>
      completeExpenses[idCategory]?[day]?.values
          .fold<BigInt>(BigInt.from(0), (previousValue, dataDay) =>
          previousValue + dataDay.sum)??BigInt.from(0);

  /// Connect the generated [_$MonthlyExpensesFromJson] function to the `fromJson`
  /// factory.
  factory MonthlyExpenses.fromJson(Map<String, dynamic> json) => _$MonthlyExpensesFromJson(json);

  /// Connect the generated [_$MonthlyExpensesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MonthlyExpensesToJson(this);

  @override
  String toString() {
    return 'monthlyExpenses: {month: $month, year: $year MonthlyExpenses: $completeExpenses}';
  }

}
