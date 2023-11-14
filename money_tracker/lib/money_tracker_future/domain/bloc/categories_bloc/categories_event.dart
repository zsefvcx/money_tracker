
part of 'categories_bloc.dart';

@freezed
class CategoriesBlocEvent with _$CategoriesBlocEvent{
  const factory CategoriesBlocEvent.init({required String uuid,}) = _initEvent;
  const factory CategoriesBlocEvent.read({required String uuid, required int id, required Completer<dynamic> completer,}) = _readEvent;
  const factory CategoriesBlocEvent.add({required String uuid, required CategoryExpenses data,}) = _addEvent;
  const factory CategoriesBlocEvent.delete({required String uuid,}) = _deleteEvent;
}
