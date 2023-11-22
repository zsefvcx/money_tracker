
part of 'monthly_expenses_bloc.dart';

@freezed
class MonthlyExpensesBlocEvent with _$MonthlyExpensesBlocEvent{
  const factory MonthlyExpensesBlocEvent.add({
    required String uuid,
    required DayExpense data,
    required Completer<dynamic> completer,
  }) = _addEvent;
  const factory MonthlyExpensesBlocEvent.readTotal({
    required String uuid,
    required int idMonth,
    required int idCategory,
    required Completer<dynamic> completer,
  }) = _readTotalEvent;
  const factory MonthlyExpensesBlocEvent.deleteWithCategory({
    required String uuid,
    required int idCategory,
  }) = _deleteWithCategoryEvent;





  const factory MonthlyExpensesBlocEvent.init({
    required String uuid,
  }) = _initEvent;
  const factory MonthlyExpensesBlocEvent.read({
    required String uuid,
    required int id,
    required Completer<dynamic> completer,
  }) = _readEvent;


  const factory MonthlyExpensesBlocEvent.delete({
    required String uuid,
  }) = _deleteEvent;
  const factory MonthlyExpensesBlocEvent.update({
    required String uuid,
    required DayExpense data,
  }) = _updateEvent;
  const factory MonthlyExpensesBlocEvent.check({
    required String uuid,
    required DayExpense data,
    required Completer<dynamic> completer,
  }) = _checkEvent;
  const factory MonthlyExpensesBlocEvent.deleteId({
    required String uuid,
    required int id
  }) = _deleteIdEvent;
}
