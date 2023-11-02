import 'dart:convert';

import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/login_future/core/core.dart';
import 'package:money_tracker/login_future/data/data.dart';
import 'package:money_tracker/login_future/domain/domain.dart';
import 'package:uuid/uuid.dart';

class SetUserAuthServiceImpl implements SetUserAuthService {

  final SecureStorage secureStorage;

  SetUserAuthServiceImpl({required this.secureStorage});

  @override
  Future<UserAuthorizationPasswordEntity?> setPasswordAndUserGroup({
    required String userNameHash512,
    required String userPasswordHash512,
    required String eMail,
    required UserGroup userGroup,
    bool internet = false
  }) async {
    try{
      final user = UserAuthorizationPasswordModel(
        uuid: const Uuid().v1(),
        statusAuthorization: true,
        loadImage: false,
        userNameHash512: userNameHash512,
        userPasswordHash512: userPasswordHash512,
        eMail: eMail,
        userGroup: userGroup,
      );
      final json = user.toMap();
      final res = jsonEncode(json);
      // Write value
      await secureStorage.write(key: Keys.userData, value: res);
      return user;
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
      await secureStorage.delete(key: Keys.userData);
      return true;
    } on Exception catch(e){
      throw ArgumentError('Error deleteUserData: $e');
    }
  }

  @override
  Future<UserAuthorizationPasswordModel?> logout() async{
    try{
      // Read value
      final userData = await secureStorage.read(key: Keys.userData);
      if (userData == null || userData == '') return null;
      final json = jsonDecode(userData);
      if (json is Map<String, dynamic>) {
        final user = UserAuthorizationPasswordModel.fromMap(json);
        if(user.statusAuthorization) {
          final user1 = user.copyWith(
            statusAuthorization: false,
          );
          final res = jsonEncode(user1.toMap());
          // Write value
          await secureStorage.write(key: Keys.userData, value: res);
          return user1;
        } else {
          return user;
        }
      }
      return null;
    } on Exception catch(e){
      throw ArgumentError('Error logout: $e');
    }
  }

  @override
  Future<UserAuthorizationPasswordModel?> changeLoadImageStatus({required bool status}) async {
    try{
      // Read value
      final userData = await secureStorage.read(key: Keys.userData);
      if (userData == null || userData == '') return null;
      final json = jsonDecode(userData);
      if (json is Map<String, dynamic>) {
        final user = UserAuthorizationPasswordModel.fromMap(json);
        if(user.loadImage != status) {
          final user1 = user.copyWith(
            loadImage: status,
          );
          final res = jsonEncode(user1.toMap());
          // Write value
          await secureStorage.write(key: Keys.userData, value: res);
          return user1;
        } else {
          return user;
        }
      }
      return null;
    } on Exception catch(e){
      throw ArgumentError('Error logout: $e');
    }
  }

}
