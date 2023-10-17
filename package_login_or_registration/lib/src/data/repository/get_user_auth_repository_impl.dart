import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/data_sources/get/get_user_auth_service.dart';
import 'package:package_login_or_registration/src/domain/entities/user_authorization_password_entity.dart';
import 'package:package_login_or_registration/src/domain/repositories/get_user_auth_repository.dart';

class GetUserAuthRepositoryImpl implements GetUserAuthRepository {

  final NetworkInfo networkInfo;
  final GetUserAuthService getUserAuthService;

  GetUserAuthRepositoryImpl({
    required this.networkInfo,
    required this.getUserAuthService,
  });

  @override
  Future<bool?> checkUserName({required String userNameHash512}) async {
    return await getUserAuthService.checkUserName(
        userNameHash512: userNameHash512,
        internet: await networkInfo.isConnected,
    );
  }

  @override
  Future<UserAuthorizationPasswordEntity?> checkPassword({
    required String userNameHash512,
    required String userPasswordHash512
  }) async {
    return await getUserAuthService.checkPassword(
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        internet: await networkInfo.isConnected,
    );
  }

  @override
  Future<UserAuthorizationPasswordEntity?> loadUserData() async {
    return await getUserAuthService.loadUserData();
  }
}
