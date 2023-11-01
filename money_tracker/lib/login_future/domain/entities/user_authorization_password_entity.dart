import 'package:money_tracker/login_future/core/core.dart';

abstract class UserAuthorizationPasswordEntity {

  final int? id;
  final String userNameHash512;
  final String? userPasswordHash512;
  final UserGroup? userGroup;
  final String uuid;
  final String eMail;
  final bool statusAuthorization;
  final bool loadImage;

  const UserAuthorizationPasswordEntity({
    required this.uuid,
    required this.statusAuthorization,
    required this.loadImage,
    required this.eMail,
    required this.userNameHash512,
    this.userPasswordHash512,
    this.userGroup,
    this.id,
  });

}
