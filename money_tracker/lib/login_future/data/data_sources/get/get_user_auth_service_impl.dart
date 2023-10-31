import 'dart:convert';

import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data.dart';

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
          final json1 = user.copyWith(
            statusAuthorization: true,
          ).toMap();
          final res = jsonEncode(json1);
          // Write value
          await secureStorage.write(key: Keys.userData, value: res);
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
