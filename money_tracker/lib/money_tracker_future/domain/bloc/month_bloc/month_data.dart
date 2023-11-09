
part of 'month_bloc.dart';

//@injectable
class MonthModelData {

  final bool timeOut;
  final MonthsCurrentYearEntity? data;
  final bool error;
  final String e;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const MonthModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  MonthModelData copyWithData({
    required MonthsCurrentYearEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return MonthModelData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}
