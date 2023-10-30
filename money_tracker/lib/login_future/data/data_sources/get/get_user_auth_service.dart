
import 'package:money_tracker/login_future/data/data.dart';

abstract class GetUserAuthService {

  Future<bool?> checkUserName({
    required String userNameHash512,
    bool internet = false,
  });

  Future<bool?> checkPassword({
    required String userNameHash512,
    required String userPasswordHash512,
    bool internet = false,
  });

  Future<UserAuthorizationPasswordModel?> loadUserData();
}
