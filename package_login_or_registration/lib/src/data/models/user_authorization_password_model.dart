import 'package:flutter/foundation.dart';
import 'package:package_login_or_registration/src/core/user_group.dart';
import 'package:package_login_or_registration/src/domain/entities/user_authorization_password_entity.dart';

@immutable
class UserAuthorizationPasswordModel extends UserAuthorizationPasswordEntity{

//<editor-fold desc="Data Methods">
  const UserAuthorizationPasswordModel({
    required super.statusAuthorization,
    required super.userNameHash512,
    super.userPasswordHash512,
    super.userGroup,
    super.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAuthorizationPasswordModel &&
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
    return 'UserAuthorizationPassword{statusAuthorization:$statusAuthorization,'
           ' id: $id, '
           'userNameHash512: $userNameHash512, '
           'userPasswordHash512: $userPasswordHash512, '
           'userGroup: $userGroup';
  }

  UserAuthorizationPasswordModel copyWith({
    bool? statusAuthorization,
    int? id,
    String? userNameHash512,
    String? userPasswordHash512,
    UserGroup? userGroup,
  }) {
    return UserAuthorizationPasswordModel(
      statusAuthorization: statusAuthorization ?? this.statusAuthorization,
      id: id ?? this.id,
      userNameHash512: userNameHash512 ?? this.userNameHash512,
      userPasswordHash512: userPasswordHash512 ?? this.userPasswordHash512,
      userGroup: userGroup ?? this.userGroup,
    );
  }

  Map<String, dynamic> toMap() {
    final ug = userGroup??UserGroup.guest;
    return {
      'statusAuthorization': statusAuthorization,
      'id': id,
      'userNameHash512': userNameHash512,
      'userPasswordHash512': userPasswordHash512,
      'userGroup': ug.index,
    };
  }

  factory UserAuthorizationPasswordModel.fromMap(Map<String, dynamic> map) {
    final ugInd = map['userGroup'] as int;
    return UserAuthorizationPasswordModel(
      statusAuthorization: map['statusAuthorization'] as bool,
      id: map['id'] as int?,
      userNameHash512: map['userNameHash512'] as String,
      userPasswordHash512: map['userPasswordHash512'] as String,
      userGroup: UserGroup.values[ugInd],
    );
  }

//</editor-fold>
}
