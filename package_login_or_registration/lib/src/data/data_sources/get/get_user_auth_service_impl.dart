import 'dart:convert';

import 'package:package_login_or_registration/src/core/core.dart';
import 'package:package_login_or_registration/src/data/data.dart';

class GetUserAuthServiceImpl implements GetUserAuthService {

  final SecureStorage secureStorage;

  GetUserAuthServiceImpl({required this.secureStorage});

  @override
  Future<bool?> checkPassword({
    required String userNameHash512,
    required String userPasswordHash512,
    bool internet = false
  }) async {
    try{
      // Read value
      final userData = await secureStorage.read(key: Keys.userData);
      if (userData == null || userData == '') return null;
      final json = jsonDecode(userData);
      if (json is Map<String, dynamic>) {
        final user = UserAuthorizationPasswordModel.fromMap(json);
        if (userNameHash512 == user.userNameHash512 &&
            userPasswordHash512 == user.userPasswordHash512
        ){
          return true;
        }
      }
      return null;
    } on Exception catch(e){
      throw ArgumentError('Error checkPassword: $e');
    }
  }

  @override
  Future<bool?> checkUserName({required String userNameHash512, bool internet = false}) async {
    try{
      // Read value
      final userName = await secureStorage.read(key: Keys.userName);
      if (userName == null || userName == '') return null;
      return userNameHash512 == userName;
    } on Exception catch(e){
      throw ArgumentError('Error checkUserName: $e');
    }
  }

  @override
  Future<UserAuthorizationPasswordModel?> loadUserData() async {
    try{
      // Read value
      final userData = await secureStorage.read(key: Keys.userData);
      if (userData == null || userData == '') return null;
      final json = jsonDecode(userData);
      return json is Map<String, dynamic>?UserAuthorizationPasswordModel.fromMap(json):null;
    } on Exception catch(e){
      throw ArgumentError('Error loadUserData: $e');
    }
  }
}
