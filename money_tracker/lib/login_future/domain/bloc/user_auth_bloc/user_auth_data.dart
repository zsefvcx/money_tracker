part of 'user_auth_bloc.dart';

//@injectable
class UserAuthData {

  final bool timeOut;
  final UserAuthorizationPasswordEntity? data;
  final String uuid;
  final String eMail;
  final bool statusAuthorization;
  final bool error;
  final String e;

  bool? get isLoaded => data?.statusAuthorization;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const UserAuthData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
    this.uuid = '',
    this.eMail = '',
    this.statusAuthorization = false,
  });

  UserAuthData copyWithData({
    UserAuthorizationPasswordEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
    String? uuid,
    String? eMail,
    bool? statusAuthorization,
  }){
    return UserAuthData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
      uuid: uuid ?? this.uuid,
      eMail: eMail ?? this.eMail,
      statusAuthorization: statusAuthorization ?? this.statusAuthorization,
    );
  }
}