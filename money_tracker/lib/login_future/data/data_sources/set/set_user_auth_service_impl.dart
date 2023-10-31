import 'dart:convert';

import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data.dart';

class SetUserAuthServiceImpl implements SetUserAuthService {

  final SecureStorage secureStorage;

  SetUserAuthServiceImpl({required this.secureStorage});

  @override
  Future<bool?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required String eMail,
    required UserGroup userGroup,
    bool internet = false
  }) async {
    try{
      final user = UserAuthorizationPasswordModel(
        statusAuthorization: true,
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        eMail: eMail,
        userGroup: userGroup,
      );
      final json = user.toMap();
      final res = jsonEncode(json);
      // Write value
      await secureStorage.write(key: Keys.userData, value: res);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error setPasswordAndUserGroup: $e');
    }
  }

  @override
  Future<bool?> setUserName({required String userNameHash512, bool internet = false}) async {
    try{
      // Write value
      await secureStorage.write(key: Keys.userName, value: userNameHash512);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error setUserName: $e');
    }
  }

  @override
  Future<bool?> deleteUserData({bool internet = false}) async {
    try{
      // Write value
      await secureStorage.delete(key: Keys.userName);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error deleteUserData: $e');
    }
  }

  @override
  Future<bool?> updateUserData({required UserAuthorizationPasswordModel value, bool internet = false}) async {
    try {
      final json = value.toMap();
      final res = jsonEncode(json);
      // Write value
      await secureStorage.write(key: Keys.userData, value: res);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error updateUserData: $e');
    }
  }

  @override
  Future<bool?> logout() async{
    try{
      // Read value
      final userData = await secureStorage.read(key: Keys.userData);
      if (userData == null || userData == '') return null;
      final json = jsonDecode(userData);
      if (json is Map<String, dynamic>) {
        final user = UserAuthorizationPasswordModel.fromMap(json);
        final json1 = user.copyWith(
          statusAuthorization: false,
        ).toMap();
        final res = jsonEncode(json1);
        // Write value
        await secureStorage.write(key: Keys.userData, value: res);
        return true;
      }
      return null;
    } on Exception catch(e){
      throw ArgumentError('Error logout: $e');
    }



  }

}
