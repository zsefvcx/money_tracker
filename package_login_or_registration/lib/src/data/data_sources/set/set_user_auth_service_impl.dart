import 'dart:convert';

import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/data_sources/set/set_user_auth_service.dart';
import 'package:package_login_or_registration/src/data/models/user_authorization_password_model.dart';

class SetUserAuthServiceImpl implements SetUserAuthService {

  final SecureStorage secureStorage;

  SetUserAuthServiceImpl({required this.secureStorage});

  @override
  Future<bool?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required UserGroup userGroup,
    bool internet = false
  }) async {
    try{
      final user = UserAuthorizationPasswordModel(
        statusAuthorization: true,
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        userGroup: userGroup,
      );
      final json = user.toMap();
      final res = jsonEncode(json);
      // Write value
      await secureStorage.write(key: Keys.userData, value: res);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error setPasswordAndUserGroup: $e');
    }
  }

  @override
  Future<bool?> setUserName({required String userNameHash512, bool internet = false}) async {
    try{
      // Write value
      await secureStorage.write(key: Keys.userName, value: userNameHash512);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error setUserName: $e');
    }
  }

  @override
  Future<bool?> deleteUserData({bool internet = false}) async {
    try{
      // Write value
      await secureStorage.delete(key: Keys.userName);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error deleteUserData: $e');
    }
  }

  @override
  Future<bool?> updateUserData({required UserAuthorizationPasswordModel value, bool internet = false}) async {
    try {
      final json = value.toMap();
      final res = jsonEncode(json);
      // Write value
      await secureStorage.write(key: Keys.userData, value: res);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error updateUserData: $e');
    }
  }

}
