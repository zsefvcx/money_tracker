
part of 'photo_bloc.dart';

@freezed
class PhotoBlocState with _$PhotoBlocState{
  const factory PhotoBlocState.loading() = _loadingState;
  const factory PhotoBlocState.loaded({
    required PhotosEntity? entity
  }) = _loadedState;
  const factory PhotoBlocState.error() = _errorState;
  const factory PhotoBlocState.timeOut() = _timeOut;
}
