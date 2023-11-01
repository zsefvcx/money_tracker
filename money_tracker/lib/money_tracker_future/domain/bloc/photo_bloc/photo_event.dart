
part of 'photo_bloc.dart';

@freezed
class PhotoBlocEvent with _$PhotoBlocEvent{
  const factory PhotoBlocEvent.init({required String uuid}) = _initEvent;
  const factory PhotoBlocEvent.read({required String uuid}) = _readEvent;
  const factory PhotoBlocEvent.write({required String uuid, required String path, required Completer<dynamic> completer,}) = _writeEvent;
  const factory PhotoBlocEvent.delete({required String uuid, required Completer<dynamic> completer,}) = _deleteEvent;
}
