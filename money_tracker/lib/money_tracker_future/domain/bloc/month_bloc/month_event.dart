
part of 'month_bloc.dart';

@freezed
class MonthBlocEvent with _$MonthBlocEvent{
  const factory MonthBlocEvent.init({required String uuid}) = _initEvent;
  const factory MonthBlocEvent.read({required String uuid}) = _readEvent;
  const factory MonthBlocEvent.add({required String uuid, required int month, required Completer<dynamic> completer,}) = _addEvent;
  const factory MonthBlocEvent.delete({required String uuid, required Completer<dynamic> completer,}) = _deleteEvent;
}
