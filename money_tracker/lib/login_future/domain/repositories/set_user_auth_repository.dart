import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/domain/domain.dart';

abstract class SetUserAuthRepository {

  Future<bool?> setUserName({
    required String userNameHash512
  });

  Future<bool?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required String eMail,
    required UserGroup userGroup,
  });

  Future<bool?> deleteUserData();

  Future<UserAuthorizationPasswordEntity?> logout();

  Future<UserAuthorizationPasswordEntity?> changeLoadImageStatus({required bool status});
}
