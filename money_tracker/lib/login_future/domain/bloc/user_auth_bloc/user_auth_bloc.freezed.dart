// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserAuthEvent {
  Completer<dynamic>? get completer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthEventCopyWith<UserAuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthEventCopyWith<$Res> {
  factory $UserAuthEventCopyWith(
          UserAuthEvent value, $Res Function(UserAuthEvent) then) =
      _$UserAuthEventCopyWithImpl<$Res, UserAuthEvent>;
  @useResult
  $Res call({Completer<dynamic> completer});
}

/// @nodoc
class _$UserAuthEventCopyWithImpl<$Res, $Val extends UserAuthEvent>
    implements $UserAuthEventCopyWith<$Res> {
  _$UserAuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = null,
  }) {
    return _then(_value.copyWith(
      completer: null == completer
          ? _value.completer!
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$initEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$initEventImplCopyWith(
          _$initEventImpl value, $Res Function(_$initEventImpl) then) =
      __$$initEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Completer<dynamic>? completer});
}

/// @nodoc
class __$$initEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$initEventImpl>
    implements _$$initEventImplCopyWith<$Res> {
  __$$initEventImplCopyWithImpl(
      _$initEventImpl _value, $Res Function(_$initEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = freezed,
  }) {
    return _then(_$initEventImpl(
      completer: freezed == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>?,
    ));
  }
}

/// @nodoc

class _$initEventImpl implements _initEvent {
  const _$initEventImpl({this.completer});

  @override
  final Completer<dynamic>? completer;

  @override
  String toString() {
    return 'UserAuthEvent.init(completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initEventImpl &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      __$$initEventImplCopyWithImpl<_$initEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return init(completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return init?.call(completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements UserAuthEvent {
  const factory _initEvent({final Completer<dynamic>? completer}) =
      _$initEventImpl;

  @override
  Completer<dynamic>? get completer;
  @override
  @JsonKey(ignore: true)
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$deleteEventImplCopyWith(
          _$deleteEventImpl value, $Res Function(_$deleteEventImpl) then) =
      __$$deleteEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Completer<dynamic>? completer});
}

/// @nodoc
class __$$deleteEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$deleteEventImpl>
    implements _$$deleteEventImplCopyWith<$Res> {
  __$$deleteEventImplCopyWithImpl(
      _$deleteEventImpl _value, $Res Function(_$deleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = freezed,
  }) {
    return _then(_$deleteEventImpl(
      completer: freezed == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>?,
    ));
  }
}

/// @nodoc

class _$deleteEventImpl implements _deleteEvent {
  const _$deleteEventImpl({this.completer});

  @override
  final Completer<dynamic>? completer;

  @override
  String toString() {
    return 'UserAuthEvent.delete(completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteEventImpl &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      __$$deleteEventImplCopyWithImpl<_$deleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return delete(completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return delete?.call(completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _deleteEvent implements UserAuthEvent {
  const factory _deleteEvent({final Completer<dynamic>? completer}) =
      _$deleteEventImpl;

  @override
  Completer<dynamic>? get completer;
  @override
  @JsonKey(ignore: true)
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$logoutEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$logoutEventImplCopyWith(
          _$logoutEventImpl value, $Res Function(_$logoutEventImpl) then) =
      __$$logoutEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Completer<dynamic> completer});
}

/// @nodoc
class __$$logoutEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$logoutEventImpl>
    implements _$$logoutEventImplCopyWith<$Res> {
  __$$logoutEventImplCopyWithImpl(
      _$logoutEventImpl _value, $Res Function(_$logoutEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completer = null,
  }) {
    return _then(_$logoutEventImpl(
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$logoutEventImpl implements _logoutEvent {
  const _$logoutEventImpl({required this.completer});

  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.logout(completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$logoutEventImpl &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$logoutEventImplCopyWith<_$logoutEventImpl> get copyWith =>
      __$$logoutEventImplCopyWithImpl<_$logoutEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return logout(completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return logout?.call(completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _logoutEvent implements UserAuthEvent {
  const factory _logoutEvent({required final Completer<dynamic> completer}) =
      _$logoutEventImpl;

  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$logoutEventImplCopyWith<_$logoutEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$changeLoadImageStatusEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$changeLoadImageStatusEventImplCopyWith(
          _$changeLoadImageStatusEventImpl value,
          $Res Function(_$changeLoadImageStatusEventImpl) then) =
      __$$changeLoadImageStatusEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, Completer<dynamic> completer});
}

/// @nodoc
class __$$changeLoadImageStatusEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$changeLoadImageStatusEventImpl>
    implements _$$changeLoadImageStatusEventImplCopyWith<$Res> {
  __$$changeLoadImageStatusEventImplCopyWithImpl(
      _$changeLoadImageStatusEventImpl _value,
      $Res Function(_$changeLoadImageStatusEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? completer = null,
  }) {
    return _then(_$changeLoadImageStatusEventImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$changeLoadImageStatusEventImpl implements _changeLoadImageStatusEvent {
  const _$changeLoadImageStatusEventImpl(
      {required this.status, required this.completer});

  @override
  final bool status;
  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.changeLoadImageStatus(status: $status, completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$changeLoadImageStatusEventImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$changeLoadImageStatusEventImplCopyWith<_$changeLoadImageStatusEventImpl>
      get copyWith => __$$changeLoadImageStatusEventImplCopyWithImpl<
          _$changeLoadImageStatusEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return changeLoadImageStatus(status, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return changeLoadImageStatus?.call(status, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (changeLoadImageStatus != null) {
      return changeLoadImageStatus(status, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return changeLoadImageStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return changeLoadImageStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (changeLoadImageStatus != null) {
      return changeLoadImageStatus(this);
    }
    return orElse();
  }
}

abstract class _changeLoadImageStatusEvent implements UserAuthEvent {
  const factory _changeLoadImageStatusEvent(
          {required final bool status,
          required final Completer<dynamic> completer}) =
      _$changeLoadImageStatusEventImpl;

  bool get status;
  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$changeLoadImageStatusEventImplCopyWith<_$changeLoadImageStatusEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$checkUserNameEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$checkUserNameEventImplCopyWith(_$checkUserNameEventImpl value,
          $Res Function(_$checkUserNameEventImpl) then) =
      __$$checkUserNameEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userNameHash512, Completer<dynamic> completer});
}

/// @nodoc
class __$$checkUserNameEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$checkUserNameEventImpl>
    implements _$$checkUserNameEventImplCopyWith<$Res> {
  __$$checkUserNameEventImplCopyWithImpl(_$checkUserNameEventImpl _value,
      $Res Function(_$checkUserNameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameHash512 = null,
    Object? completer = null,
  }) {
    return _then(_$checkUserNameEventImpl(
      userNameHash512: null == userNameHash512
          ? _value.userNameHash512
          : userNameHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$checkUserNameEventImpl implements _checkUserNameEvent {
  const _$checkUserNameEventImpl(
      {required this.userNameHash512, required this.completer});

  @override
  final String userNameHash512;
  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.checkUserName(userNameHash512: $userNameHash512, completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$checkUserNameEventImpl &&
            (identical(other.userNameHash512, userNameHash512) ||
                other.userNameHash512 == userNameHash512) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userNameHash512, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$checkUserNameEventImplCopyWith<_$checkUserNameEventImpl> get copyWith =>
      __$$checkUserNameEventImplCopyWithImpl<_$checkUserNameEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return checkUserName(userNameHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return checkUserName?.call(userNameHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (checkUserName != null) {
      return checkUserName(userNameHash512, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return checkUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return checkUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (checkUserName != null) {
      return checkUserName(this);
    }
    return orElse();
  }
}

abstract class _checkUserNameEvent implements UserAuthEvent {
  const factory _checkUserNameEvent(
      {required final String userNameHash512,
      required final Completer<dynamic> completer}) = _$checkUserNameEventImpl;

  String get userNameHash512;
  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$checkUserNameEventImplCopyWith<_$checkUserNameEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$checkPasswordEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$checkPasswordEventImplCopyWith(_$checkPasswordEventImpl value,
          $Res Function(_$checkPasswordEventImpl) then) =
      __$$checkPasswordEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userNameHash512,
      String userPasswordHash512,
      Completer<dynamic> completer});
}

/// @nodoc
class __$$checkPasswordEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$checkPasswordEventImpl>
    implements _$$checkPasswordEventImplCopyWith<$Res> {
  __$$checkPasswordEventImplCopyWithImpl(_$checkPasswordEventImpl _value,
      $Res Function(_$checkPasswordEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameHash512 = null,
    Object? userPasswordHash512 = null,
    Object? completer = null,
  }) {
    return _then(_$checkPasswordEventImpl(
      userNameHash512: null == userNameHash512
          ? _value.userNameHash512
          : userNameHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      userPasswordHash512: null == userPasswordHash512
          ? _value.userPasswordHash512
          : userPasswordHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$checkPasswordEventImpl implements _checkPasswordEvent {
  const _$checkPasswordEventImpl(
      {required this.userNameHash512,
      required this.userPasswordHash512,
      required this.completer});

  @override
  final String userNameHash512;
  @override
  final String userPasswordHash512;
  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.checkPassword(userNameHash512: $userNameHash512, userPasswordHash512: $userPasswordHash512, completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$checkPasswordEventImpl &&
            (identical(other.userNameHash512, userNameHash512) ||
                other.userNameHash512 == userNameHash512) &&
            (identical(other.userPasswordHash512, userPasswordHash512) ||
                other.userPasswordHash512 == userPasswordHash512) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userNameHash512, userPasswordHash512, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$checkPasswordEventImplCopyWith<_$checkPasswordEventImpl> get copyWith =>
      __$$checkPasswordEventImplCopyWithImpl<_$checkPasswordEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return checkPassword(userNameHash512, userPasswordHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return checkPassword?.call(userNameHash512, userPasswordHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(userNameHash512, userPasswordHash512, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return checkPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return checkPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(this);
    }
    return orElse();
  }
}

abstract class _checkPasswordEvent implements UserAuthEvent {
  const factory _checkPasswordEvent(
      {required final String userNameHash512,
      required final String userPasswordHash512,
      required final Completer<dynamic> completer}) = _$checkPasswordEventImpl;

  String get userNameHash512;
  String get userPasswordHash512;
  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$checkPasswordEventImplCopyWith<_$checkPasswordEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$setUserNameEventImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$setUserNameEventImplCopyWith(_$setUserNameEventImpl value,
          $Res Function(_$setUserNameEventImpl) then) =
      __$$setUserNameEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userNameHash512, Completer<dynamic> completer});
}

/// @nodoc
class __$$setUserNameEventImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$setUserNameEventImpl>
    implements _$$setUserNameEventImplCopyWith<$Res> {
  __$$setUserNameEventImplCopyWithImpl(_$setUserNameEventImpl _value,
      $Res Function(_$setUserNameEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameHash512 = null,
    Object? completer = null,
  }) {
    return _then(_$setUserNameEventImpl(
      userNameHash512: null == userNameHash512
          ? _value.userNameHash512
          : userNameHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$setUserNameEventImpl implements _setUserNameEvent {
  const _$setUserNameEventImpl(
      {required this.userNameHash512, required this.completer});

  @override
  final String userNameHash512;
  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.setUserName(userNameHash512: $userNameHash512, completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$setUserNameEventImpl &&
            (identical(other.userNameHash512, userNameHash512) ||
                other.userNameHash512 == userNameHash512) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userNameHash512, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$setUserNameEventImplCopyWith<_$setUserNameEventImpl> get copyWith =>
      __$$setUserNameEventImplCopyWithImpl<_$setUserNameEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return setUserName(userNameHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return setUserName?.call(userNameHash512, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (setUserName != null) {
      return setUserName(userNameHash512, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return setUserName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return setUserName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (setUserName != null) {
      return setUserName(this);
    }
    return orElse();
  }
}

abstract class _setUserNameEvent implements UserAuthEvent {
  const factory _setUserNameEvent(
      {required final String userNameHash512,
      required final Completer<dynamic> completer}) = _$setUserNameEventImpl;

  String get userNameHash512;
  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$setUserNameEventImplCopyWith<_$setUserNameEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$setPasswordAndUserGroupImplCopyWith<$Res>
    implements $UserAuthEventCopyWith<$Res> {
  factory _$$setPasswordAndUserGroupImplCopyWith(
          _$setPasswordAndUserGroupImpl value,
          $Res Function(_$setPasswordAndUserGroupImpl) then) =
      __$$setPasswordAndUserGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userNameHash512,
      String userPasswordHash512,
      String eMail,
      UserGroup userGroup,
      Completer<dynamic> completer});
}

/// @nodoc
class __$$setPasswordAndUserGroupImplCopyWithImpl<$Res>
    extends _$UserAuthEventCopyWithImpl<$Res, _$setPasswordAndUserGroupImpl>
    implements _$$setPasswordAndUserGroupImplCopyWith<$Res> {
  __$$setPasswordAndUserGroupImplCopyWithImpl(
      _$setPasswordAndUserGroupImpl _value,
      $Res Function(_$setPasswordAndUserGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userNameHash512 = null,
    Object? userPasswordHash512 = null,
    Object? eMail = null,
    Object? userGroup = null,
    Object? completer = null,
  }) {
    return _then(_$setPasswordAndUserGroupImpl(
      userNameHash512: null == userNameHash512
          ? _value.userNameHash512
          : userNameHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      userPasswordHash512: null == userPasswordHash512
          ? _value.userPasswordHash512
          : userPasswordHash512 // ignore: cast_nullable_to_non_nullable
              as String,
      eMail: null == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String,
      userGroup: null == userGroup
          ? _value.userGroup
          : userGroup // ignore: cast_nullable_to_non_nullable
              as UserGroup,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$setPasswordAndUserGroupImpl implements _setPasswordAndUserGroup {
  const _$setPasswordAndUserGroupImpl(
      {required this.userNameHash512,
      required this.userPasswordHash512,
      required this.eMail,
      required this.userGroup,
      required this.completer});

  @override
  final String userNameHash512;
  @override
  final String userPasswordHash512;
  @override
  final String eMail;
  @override
  final UserGroup userGroup;
  @override
  final Completer<dynamic> completer;

  @override
  String toString() {
    return 'UserAuthEvent.setPassword(userNameHash512: $userNameHash512, userPasswordHash512: $userPasswordHash512, eMail: $eMail, userGroup: $userGroup, completer: $completer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$setPasswordAndUserGroupImpl &&
            (identical(other.userNameHash512, userNameHash512) ||
                other.userNameHash512 == userNameHash512) &&
            (identical(other.userPasswordHash512, userPasswordHash512) ||
                other.userPasswordHash512 == userPasswordHash512) &&
            (identical(other.eMail, eMail) || other.eMail == eMail) &&
            (identical(other.userGroup, userGroup) ||
                other.userGroup == userGroup) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userNameHash512,
      userPasswordHash512, eMail, userGroup, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$setPasswordAndUserGroupImplCopyWith<_$setPasswordAndUserGroupImpl>
      get copyWith => __$$setPasswordAndUserGroupImplCopyWithImpl<
          _$setPasswordAndUserGroupImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Completer<dynamic>? completer) init,
    required TResult Function(Completer<dynamic>? completer) delete,
    required TResult Function(Completer<dynamic> completer) logout,
    required TResult Function(bool status, Completer<dynamic> completer)
        changeLoadImageStatus,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        checkUserName,
    required TResult Function(String userNameHash512,
            String userPasswordHash512, Completer<dynamic> completer)
        checkPassword,
    required TResult Function(
            String userNameHash512, Completer<dynamic> completer)
        setUserName,
    required TResult Function(
            String userNameHash512,
            String userPasswordHash512,
            String eMail,
            UserGroup userGroup,
            Completer<dynamic> completer)
        setPassword,
  }) {
    return setPassword(
        userNameHash512, userPasswordHash512, eMail, userGroup, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Completer<dynamic>? completer)? init,
    TResult? Function(Completer<dynamic>? completer)? delete,
    TResult? Function(Completer<dynamic> completer)? logout,
    TResult? Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult? Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult? Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
  }) {
    return setPassword?.call(
        userNameHash512, userPasswordHash512, eMail, userGroup, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Completer<dynamic>? completer)? init,
    TResult Function(Completer<dynamic>? completer)? delete,
    TResult Function(Completer<dynamic> completer)? logout,
    TResult Function(bool status, Completer<dynamic> completer)?
        changeLoadImageStatus,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        checkUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            Completer<dynamic> completer)?
        checkPassword,
    TResult Function(String userNameHash512, Completer<dynamic> completer)?
        setUserName,
    TResult Function(String userNameHash512, String userPasswordHash512,
            String eMail, UserGroup userGroup, Completer<dynamic> completer)?
        setPassword,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(
          userNameHash512, userPasswordHash512, eMail, userGroup, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_logoutEvent value) logout,
    required TResult Function(_changeLoadImageStatusEvent value)
        changeLoadImageStatus,
    required TResult Function(_checkUserNameEvent value) checkUserName,
    required TResult Function(_checkPasswordEvent value) checkPassword,
    required TResult Function(_setUserNameEvent value) setUserName,
    required TResult Function(_setPasswordAndUserGroup value) setPassword,
  }) {
    return setPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_logoutEvent value)? logout,
    TResult? Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult? Function(_checkUserNameEvent value)? checkUserName,
    TResult? Function(_checkPasswordEvent value)? checkPassword,
    TResult? Function(_setUserNameEvent value)? setUserName,
    TResult? Function(_setPasswordAndUserGroup value)? setPassword,
  }) {
    return setPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_logoutEvent value)? logout,
    TResult Function(_changeLoadImageStatusEvent value)? changeLoadImageStatus,
    TResult Function(_checkUserNameEvent value)? checkUserName,
    TResult Function(_checkPasswordEvent value)? checkPassword,
    TResult Function(_setUserNameEvent value)? setUserName,
    TResult Function(_setPasswordAndUserGroup value)? setPassword,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(this);
    }
    return orElse();
  }
}

abstract class _setPasswordAndUserGroup implements UserAuthEvent {
  const factory _setPasswordAndUserGroup(
          {required final String userNameHash512,
          required final String userPasswordHash512,
          required final String eMail,
          required final UserGroup userGroup,
          required final Completer<dynamic> completer}) =
      _$setPasswordAndUserGroupImpl;

  String get userNameHash512;
  String get userPasswordHash512;
  String get eMail;
  UserGroup get userGroup;
  @override
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$setPasswordAndUserGroupImplCopyWith<_$setPasswordAndUserGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthStateCopyWith<$Res> {
  factory $UserAuthStateCopyWith(
          UserAuthState value, $Res Function(UserAuthState) then) =
      _$UserAuthStateCopyWithImpl<$Res, UserAuthState>;
}

/// @nodoc
class _$UserAuthStateCopyWithImpl<$Res, $Val extends UserAuthState>
    implements $UserAuthStateCopyWith<$Res> {
  _$UserAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$loadingStateImplCopyWith<$Res> {
  factory _$$loadingStateImplCopyWith(
          _$loadingStateImpl value, $Res Function(_$loadingStateImpl) then) =
      __$$loadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingStateImpl implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString() {
    return 'UserAuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loadingState implements UserAuthState {
  const factory _loadingState() = _$loadingStateImpl;
}

/// @nodoc
abstract class _$$newUserStateImplCopyWith<$Res> {
  factory _$$newUserStateImplCopyWith(
          _$newUserStateImpl value, $Res Function(_$newUserStateImpl) then) =
      __$$newUserStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$newUserStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$newUserStateImpl>
    implements _$$newUserStateImplCopyWith<$Res> {
  __$$newUserStateImplCopyWithImpl(
      _$newUserStateImpl _value, $Res Function(_$newUserStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$newUserStateImpl implements _newUserState {
  const _$newUserStateImpl();

  @override
  String toString() {
    return 'UserAuthState.newUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$newUserStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return newUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return newUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (newUser != null) {
      return newUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return newUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return newUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (newUser != null) {
      return newUser(this);
    }
    return orElse();
  }
}

abstract class _newUserState implements UserAuthState {
  const factory _newUserState() = _$newUserStateImpl;
}

/// @nodoc
abstract class _$$loadedStateImplCopyWith<$Res> {
  factory _$$loadedStateImplCopyWith(
          _$loadedStateImpl value, $Res Function(_$loadedStateImpl) then) =
      __$$loadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadedStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$loadedStateImpl>
    implements _$$loadedStateImplCopyWith<$Res> {
  __$$loadedStateImplCopyWithImpl(
      _$loadedStateImpl _value, $Res Function(_$loadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadedStateImpl implements _loadedState {
  const _$loadedStateImpl();

  @override
  String toString() {
    return 'UserAuthState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loadedState implements UserAuthState {
  const factory _loadedState() = _$loadedStateImpl;
}

/// @nodoc
abstract class _$$errorStateImplCopyWith<$Res> {
  factory _$$errorStateImplCopyWith(
          _$errorStateImpl value, $Res Function(_$errorStateImpl) then) =
      __$$errorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$errorStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$errorStateImpl>
    implements _$$errorStateImplCopyWith<$Res> {
  __$$errorStateImplCopyWithImpl(
      _$errorStateImpl _value, $Res Function(_$errorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$errorStateImpl implements _errorState {
  const _$errorStateImpl();

  @override
  String toString() {
    return 'UserAuthState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$errorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _errorState implements UserAuthState {
  const factory _errorState() = _$errorStateImpl;
}

/// @nodoc
abstract class _$$timeOutImplCopyWith<$Res> {
  factory _$$timeOutImplCopyWith(
          _$timeOutImpl value, $Res Function(_$timeOutImpl) then) =
      __$$timeOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$timeOutImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$timeOutImpl>
    implements _$$timeOutImplCopyWith<$Res> {
  __$$timeOutImplCopyWithImpl(
      _$timeOutImpl _value, $Res Function(_$timeOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$timeOutImpl implements _timeOut {
  const _$timeOutImpl();

  @override
  String toString() {
    return 'UserAuthState.timeOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$timeOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() newUser,
    required TResult Function() loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? newUser,
    TResult? Function()? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? newUser,
    TResult Function()? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_newUserState value) newUser,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) {
    return timeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_newUserState value)? newUser,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) {
    return timeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_newUserState value)? newUser,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) {
    if (timeOut != null) {
      return timeOut(this);
    }
    return orElse();
  }
}

abstract class _timeOut implements UserAuthState {
  const factory _timeOut() = _$timeOutImpl;
}
