import 'package:flutter/foundation.dart';
import 'package:money_tracker/login_future/core/users/user_group.dart';
import 'package:money_tracker/login_future/domain/entities/user_authorization_password_entity.dart';

@immutable
class UserAuthorizationPasswordModel extends UserAuthorizationPasswordEntity{

//<editor-fold desc="Data Methods">
  const UserAuthorizationPasswordModel({
    required super.uuid,
    required super.eMail,
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
          statusAuthorization == other.statusAuthorization &&
          uuid ==  other.uuid &&
          eMail ==  other.eMail &&
          userPasswordHash512 == other.userPasswordHash512 &&
          userGroup == other.userGroup);

  @override
  int get hashCode =>
      id.hashCode ^
      userNameHash512.hashCode ^
      userPasswordHash512.hashCode ^
      userGroup.hashCode ^
      statusAuthorization.hashCode ^
      eMail.hashCode ^
      uuid.hashCode;

  @override
  String toString() {
    return 'UserAuthorizationPassword{statusAuthorization:$statusAuthorization,'
           ' uuid: $uuid'
           ' eMail: $eMail,'
           ' id: $id, '
           'userNameHash512: $userNameHash512, '
           'userPasswordHash512: $userPasswordHash512, '
           'userGroup: $userGroup';
  }

  UserAuthorizationPasswordModel copyWith({
    String? uuid,
    String? eMail,
    bool? statusAuthorization,
    int? id,
    String? userNameHash512,
    String? userPasswordHash512,
    UserGroup? userGroup,
  }) {
    return UserAuthorizationPasswordModel(
      uuid: uuid ?? this.uuid,
      eMail: eMail ?? this.eMail,
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
      'eMail' : eMail,
      'uuid' : uuid,
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
      eMail: map['eMail'] as String,
      uuid: map['uuid'] as String,
    );
  }

//</editor-fold>
}
