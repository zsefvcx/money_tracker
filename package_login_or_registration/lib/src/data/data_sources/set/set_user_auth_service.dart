import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/models/user_authorization_password_model.dart';
import 'package:package_login_or_registration/src/domain/entities/user_authorization_password_entity.dart';

abstract class SetUserAuthService {

  Future<bool?> setUserName({
    required String userNameHash512,
    bool internet = false,
  });

  Future<bool?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required UserGroup userGroup,
    bool internet = false,
  });

  Future<bool?> updateUserData({required UserAuthorizationPasswordModel value, bool internet = false,});

  Future<bool?> deleteUserData({bool internet = false,});
}
