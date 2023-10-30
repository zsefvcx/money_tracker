import 'package:money_tracker/login_future/core/core.dart';

abstract class UserAuthorizationPasswordEntity {

  final int? id;
  final String userNameHash512;
  final String? userPasswordHash512;
  final UserGroup? userGroup;
  final bool statusAuthorization;

  const UserAuthorizationPasswordEntity({
    required this.statusAuthorization,
    required this.userNameHash512,
    this.userPasswordHash512,
    this.userGroup,
    this.id,
  });

}
