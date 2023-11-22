
part of 'monthly_expenses_bloc.dart';

@freezed
class MonthlyExpensesBlocState with _$MonthlyExpensesBlocState{
  const factory MonthlyExpensesBlocState.loading() = _loadingState;
  const factory MonthlyExpensesBlocState.loaded({
    required MonthlyExpensesEntity? entity,
  }) = _loadedState;
  const factory MonthlyExpensesBlocState.error() = _errorState;
  const factory MonthlyExpensesBlocState.timeOut() = _timeOut;
}
