import 'package:package_login_or_registration/src/core/user_group.dart';
import 'package:package_login_or_registration/src/data/data_sources/set/set_user_auth_service.dart';
import 'package:package_login_or_registration/src/domain/entities/user_authorization_password_entity.dart';

class SetUserAuthServiceImpl implements SetUserAuthService {
  @override
  Future<UserAuthorizationPasswordEntity?> setPasswordAndUserGroup({required String userNameHash512, required String userPasswordHash512, required UserGroup userGroup, bool internet = false}) {
    // TODO: implement setPasswordAndUserGroup
    throw UnimplementedError();
  }

  @override
  Future<bool?> setUserName({required String userNameHash512, bool internet = false}) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteUserData({bool internet = false}) {
    // TODO: implement deleteUserData
    throw UnimplementedError();
  }

  @override
  Future<bool?> updateUserData({required UserAuthorizationPasswordEntity value, bool internet = false}) {
    // TODO: implement updateUserData
    throw UnimplementedError();
  }

}
