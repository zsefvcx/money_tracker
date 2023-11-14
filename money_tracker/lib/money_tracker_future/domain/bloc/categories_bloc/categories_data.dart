
part of 'categories_bloc.dart';

//@injectable
class CategoriesModelData {

  final bool timeOut;
  final CategoriesExpensesModels? data;
  final bool error;
  final String e;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const CategoriesModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  CategoriesModelData copyWithData({
    required CategoriesExpensesModels? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return CategoriesModelData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}
