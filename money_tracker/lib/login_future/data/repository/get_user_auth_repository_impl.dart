import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data_sources/get/get_user_auth_service.dart';
import 'package:money_tracker/login_future/domain/entities/user_authorization_password_entity.dart';
import 'package:money_tracker/login_future/domain/repositories/get_user_auth_repository.dart';

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
  Future<bool?> checkPassword({
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
