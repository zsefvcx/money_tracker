import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data_sources/set/set_user_auth_service.dart';
import 'package:money_tracker/login_future/domain/entities/user_authorization_password_entity.dart';
import 'package:money_tracker/login_future/domain/repositories/set_user_auth_repository.dart';

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
    required String eMail,
    required UserGroup userGroup,
  }) async {
    return await setUserAuthService.setPasswordAndUserGroup(
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        eMail: eMail,
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
  Future<UserAuthorizationPasswordEntity?> logout() async {
    return await setUserAuthService.logout();
  }

  @override
  Future<UserAuthorizationPasswordEntity?> changeLoadImageStatus({required bool status}) async {
    return await setUserAuthService.changeLoadImageStatus(status: status);
  }
}
