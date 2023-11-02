
part of 'month_bloc.dart';

@freezed
class MonthBlocState with _$MonthBlocState{
  const factory MonthBlocState.loading() = _loadingState;
  const factory MonthBlocState.loaded({required MonthAllowedEntity? model}) = _loadedState;
  const factory MonthBlocState.error() = _errorState;
  const factory MonthBlocState.timeOut() = _timeOut;
}
