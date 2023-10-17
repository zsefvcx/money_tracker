import 'package:package_login_or_registration/src/data/models/user_authorization_password_model.dart';

abstract class GetUserAuthService {
  Future<bool?> checkUserName({
    required String userNameHash512,
    bool internet = false,
  });

  Future<UserAuthorizationPasswordModel?> checkPassword({
    required String userNameHash512,
    required String userPasswordHash512,
    bool internet = false,
  });

  Future<UserAuthorizationPasswordModel?> loadUserData();
}
