import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/data_sources/set/set_user_auth_service.dart';
import 'package:package_login_or_registration/src/data/models/user_authorization_password_model.dart';
import 'package:package_login_or_registration/src/domain/entities/user_authorization_password_entity.dart';
import 'package:package_login_or_registration/src/domain/repositories/set_user_auth_repository.dart';

class SetUserAuthRepositoryImpl implements SetUserAuthRepository {

  final NetworkInfo networkInfo;
  final SetUserAuthService setUserAuthService;

  SetUserAuthRepositoryImpl({
    required this.networkInfo,
    required this.setUserAuthService,
  });

  @override
  Future<bool?> setUserName({required String userNameHash512}) async {
    return await setUserAuthService.setUserName(
        userNameHash512: userNameHash512,
        internet: await networkInfo.isConnected,
    );
  }

  @override
  Future<UserAuthorizationPasswordEntity?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required UserGroup userGroup,
  }) async {
    return await setUserAuthService.setPasswordAndUserGroup(
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        userGroup: userGroup,
        internet: await networkInfo.isConnected,
    );
  }

  @override
  Future<bool?> deleteUserData() async {
    return await setUserAuthService.deleteUserData(
      internet: await networkInfo.isConnected,
    );
  }

  @override
  Future<bool?> updateUserData({required UserAuthorizationPasswordEntity value}) async {
    return await setUserAuthService.updateUserData(
      value: value as UserAuthorizationPasswordModel,
      internet: await networkInfo.isConnected,);
  }
}
