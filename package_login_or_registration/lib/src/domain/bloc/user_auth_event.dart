part of 'user_auth_bloc.dart';

@freezed
class UserAuthEvent with _$UserAuthEvent {
  const factory UserAuthEvent.init({
    Completer<dynamic>? completer,
  }) = _initEvent;
  const factory UserAuthEvent.logout({
    required Completer<dynamic> completer,
  }) = _logoutEvent;
  const factory UserAuthEvent.updateUserData({
    required UserAuthorizationPasswordEntity value,
    required Completer<dynamic> completer,
  }) = _updateUserDataEvent;
  const factory UserAuthEvent.checkUserName({
    required String userNameHash512,
    required Completer<dynamic> completer,
  }) = _checkUserNameEvent;
  const factory UserAuthEvent.checkPassword({
    required String userNameHash512,
    required String userPasswordHash512,
    required Completer<dynamic> completer,
  }) = _checkPasswordEvent;
  const factory UserAuthEvent.setUserName({
    required String userNameHash512,
    required Completer<dynamic> completer,
  }) = _setUserNameEvent;
  const factory UserAuthEvent.setPassword({
    required String userNameHash512,
    required String userPasswordHash512,
    required UserGroup userGroup,
    required Completer<dynamic> completer,
  }) = _setPasswordAndUserGroup;
}
