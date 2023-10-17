import 'package:package_login_or_registration/src/data/data_sources/get/get_user_auth_service.dart';
import 'package:package_login_or_registration/src/data/models/user_authorization_password_model.dart';

class GetUserAuthServiceImpl implements GetUserAuthService {
  @override
  Future<UserAuthorizationPasswordModel?> checkPassword({required String userNameHash512, required String userPasswordHash512, bool internet = false}) {
    // TODO: implement checkPassword
    throw UnimplementedError();
  }

  @override
  Future<bool?> checkUserName({required String userNameHash512, bool internet = false}) {
    // TODO: implement checkUserName
    throw UnimplementedError();
  }

  @override
  Future<UserAuthorizationPasswordModel?> loadUserData() {
    // TODO: implement loadUserData
    throw UnimplementedError();
  }


}
