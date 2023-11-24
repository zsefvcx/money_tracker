
part of 'monthly_expenses_bloc.dart';

//@injectable
class MonthlyExpensesModelData {

  final bool timeOut;
  final MonthlyExpensesEntity? data;
  final bool error;
  final String e;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const MonthlyExpensesModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  MonthlyExpensesModelData copyWithData({
    required MonthlyExpensesEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return MonthlyExpensesModelData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}
