part of 'user_auth_bloc.dart';

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState.loading() = _loadingState;
  const factory UserAuthState.loaded({required UserAuthorizationPasswordEntity model}) = _loadedState;
  const factory UserAuthState.error() = _errorState;
  const factory UserAuthState.timeOut() = _timeOut;
}
