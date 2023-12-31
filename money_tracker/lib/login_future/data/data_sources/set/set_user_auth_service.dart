import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data.dart';
import 'package:money_tracker/login_future/domain/domain.dart';

abstract class SetUserAuthService {

  Future<bool?> setUserName({
    required String userNameHash512,
    bool internet = false,
  });

  Future<UserAuthorizationPasswordEntity?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required String eMail,
    required UserGroup userGroup,
    bool internet = false,
  });

  Future<bool?> deleteUserData({bool internet = false,});

  Future<UserAuthorizationPasswordModel?> logout();

  Future<UserAuthorizationPasswordModel?> changeLoadImageStatus({required bool status});
}
