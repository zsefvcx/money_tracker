import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/domain/domain.dart';

abstract class SetUserAuthRepository {

  Future<bool?> setUserName({
    required String userNameHash512
  });

  Future<bool?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required UserGroup userGroup,
  });

  Future<bool?> updateUserData({required UserAuthorizationPasswordEntity value});

  Future<bool?> deleteUserData();

}
