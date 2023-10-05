import 'dart:convert' as conv;

import 'package:flutter/foundation.dart';
import 'package:hash/hash.dart';

enum UserGroup {
  admin,
  user,
  guest;

  @override
  String toString() {
    return name;
  }
}

@immutable
class UserAuthorizationPassword {
  static String hashSHA512(String value) {
    final hash = conv.utf8.encode(value);
    if (kDebugMode) {
      print(hash);
      print(conv.utf8.decode(hash));
      print('SHA512 digest as bytes: ${SHA512().update(hash).digest()}');
    }
    return SHA512().update(hash).digest().join('.');
  }

  final int? id;
  final String userNameHash512;
  final String userPasswordHash512;
  final UserGroup userGroup;

//<editor-fold desc="Data Methods">
  const UserAuthorizationPassword({
    required this.userNameHash512,
    required this.userPasswordHash512,
    required this.userGroup,
    this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAuthorizationPassword &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userNameHash512 == other.userNameHash512 &&
          userPasswordHash512 == other.userPasswordHash512 &&
          userGroup == other.userGroup);

  @override
  int get hashCode =>
      id.hashCode ^
      userNameHash512.hashCode ^
      userPasswordHash512.hashCode ^
      userGroup.hashCode;

  @override
  String toString() {
    return 'UserAuthorizationPassword{ id: $id, userNameHash512: $userNameHash512, userPasswordHash512: $userPasswordHash512, userGroup: $userGroup,}';
  }

  UserAuthorizationPassword copyWith({
    int? id,
    String? userNameHash512,
    String? userPasswordHash512,
    UserGroup? userGroup,
  }) {
    return UserAuthorizationPassword(
      id: id ?? this.id,
      userNameHash512: userNameHash512 ?? this.userNameHash512,
      userPasswordHash512: userPasswordHash512 ?? this.userPasswordHash512,
      userGroup: userGroup ?? this.userGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userNameHash512': userNameHash512,
      'userPasswordHash512': userPasswordHash512,
      'userGroup': userGroup,
    };
  }

  factory UserAuthorizationPassword.fromMap(Map<String, dynamic> map) {
    return UserAuthorizationPassword(
      id: map['id'] as int,
      userNameHash512: map['userNameHash512'] as String,
      userPasswordHash512: map['userPasswordHash512'] as String,
      userGroup: map['userGroup'] as UserGroup,
    );
  }

//</editor-fold>
}
