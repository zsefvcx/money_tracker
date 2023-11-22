
part of 'month_bloc.dart';

@freezed
class MonthBlocEvent with _$MonthBlocEvent{
  const factory MonthBlocEvent.init({
    required String uuid,
    required MonthCurrent data,
  }) = _initEvent;
  const factory MonthBlocEvent.read({
    required String uuid,
    required int year,
    required Completer<dynamic> completer,
  }) = _readEvent;
  const factory MonthBlocEvent.add({
    required String uuid,
    required MonthCurrent data,
    required Completer<dynamic> completer,
  }) = _addEvent;
  const factory MonthBlocEvent.delete({
    required String uuid,
    required MonthCurrent data,
  }) = _deleteEvent;
}
