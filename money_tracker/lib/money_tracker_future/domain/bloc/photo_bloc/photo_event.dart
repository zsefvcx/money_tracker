
part 'photo_bloc.dart';

@freezed
class PhotoBlocEvent with _$PhotoBlocEvent{
  const factory PhotoBlocEvent.init() = _initEvent;
  const factory PhotoBlocEvent.get({required int page}) = _getEvent;//Completer
  const factory PhotoBlocEvent.getCompleter({required int page, required Completer<dynamic> completer}) = _getCompleterEvent;
  const factory PhotoBlocEvent.insert({required User value}) = _insertEvent;
  const factory PhotoBlocEvent.update({required User oldValue, required User value}) = _updateEvent;
  const factory PhotoBlocEvent.insertCard({required CardDetail value}) = _insertCardEvent;
  const factory PhotoBlocEvent.updateCard({required CardDetail value}) = _updateCardEvent;
  const factory PhotoBlocEvent.delete({required User value}) = _deleteEvent;
}
