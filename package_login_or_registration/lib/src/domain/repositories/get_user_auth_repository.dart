import 'package:package_login_or_registration/src/domain/domain.dart';

abstract class GetUserAuthRepository {

  Future<bool?> checkUserName({
    required String userNameHash512
  });

  Future<bool?> checkPassword({
    required String userNameHash512,
    required String userPasswordHash512,
  });

  Future<UserAuthorizationPasswordEntity?> loadUserData();
}
