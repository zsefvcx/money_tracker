
part of 'categories_bloc.dart';

@freezed
class CategoriesBlocEvent with _$CategoriesBlocEvent{
  const factory CategoriesBlocEvent.init({
    required String uuid,
  }) = _initEvent;
  const factory CategoriesBlocEvent.add({
    required String uuid,
    required CategoryExpenses data,
  }) = _addEvent;
  const factory CategoriesBlocEvent.delete({
    required String uuid,
  }) = _deleteEvent;
  const factory CategoriesBlocEvent.update({
    required String uuid,
    required CategoryExpenses data,
  }) = _updateEvent;
  const factory CategoriesBlocEvent.check({
    required String uuid,
    required CategoryExpenses data,
    required Completer<dynamic> completer,
  }) = _checkEvent;
  const factory CategoriesBlocEvent.deleteId({
    required String uuid,
    required int id
  }) = _deleteIdEvent;
}
