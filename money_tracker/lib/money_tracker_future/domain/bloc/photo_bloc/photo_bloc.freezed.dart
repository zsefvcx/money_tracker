// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhotoBlocEvent {
  String get uuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) init,
    required TResult Function(String uuid) read,
    required TResult Function(
            String uuid, String path, Completer<dynamic> completer)
        write,
    required TResult Function(String uuid, Completer<dynamic> completer) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? init,
    TResult? Function(String uuid)? read,
    TResult? Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult? Function(String uuid, Completer<dynamic> completer)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? init,
    TResult Function(String uuid)? read,
    TResult Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult Function(String uuid, Completer<dynamic> completer)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_writeEvent value) write,
    required TResult Function(_deleteEvent value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_writeEvent value)? write,
    TResult? Function(_deleteEvent value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_writeEvent value)? write,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoBlocEventCopyWith<PhotoBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoBlocEventCopyWith<$Res> {
  factory $PhotoBlocEventCopyWith(
          PhotoBlocEvent value, $Res Function(PhotoBlocEvent) then) =
      _$PhotoBlocEventCopyWithImpl<$Res, PhotoBlocEvent>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class _$PhotoBlocEventCopyWithImpl<$Res, $Val extends PhotoBlocEvent>
    implements $PhotoBlocEventCopyWith<$Res> {
  _$PhotoBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$initEventImplCopyWith<$Res>
    implements $PhotoBlocEventCopyWith<$Res> {
  factory _$$initEventImplCopyWith(
          _$initEventImpl value, $Res Function(_$initEventImpl) then) =
      __$$initEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$initEventImplCopyWithImpl<$Res>
    extends _$PhotoBlocEventCopyWithImpl<$Res, _$initEventImpl>
    implements _$$initEventImplCopyWith<$Res> {
  __$$initEventImplCopyWithImpl(
      _$initEventImpl _value, $Res Function(_$initEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$initEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$initEventImpl with DiagnosticableTreeMixin implements _initEvent {
  const _$initEventImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocEvent.init(uuid: $uuid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoBlocEvent.init'))
      ..add(DiagnosticsProperty('uuid', uuid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      __$$initEventImplCopyWithImpl<_$initEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) init,
    required TResult Function(String uuid) read,
    required TResult Function(
            String uuid, String path, Completer<dynamic> completer)
        write,
    required TResult Function(String uuid, Completer<dynamic> completer) delete,
  }) {
    return init(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? init,
    TResult? Function(String uuid)? read,
    TResult? Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult? Function(String uuid, Completer<dynamic> completer)? delete,
  }) {
    return init?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? init,
    TResult Function(String uuid)? read,
    TResult Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult Function(String uuid, Completer<dynamic> completer)? delete,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_writeEvent value) write,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_writeEvent value)? write,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_writeEvent value)? write,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements PhotoBlocEvent {
  const factory _initEvent({required final String uuid}) = _$initEventImpl;

  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$readEventImplCopyWith<$Res>
    implements $PhotoBlocEventCopyWith<$Res> {
  factory _$$readEventImplCopyWith(
          _$readEventImpl value, $Res Function(_$readEventImpl) then) =
      __$$readEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$readEventImplCopyWithImpl<$Res>
    extends _$PhotoBlocEventCopyWithImpl<$Res, _$readEventImpl>
    implements _$$readEventImplCopyWith<$Res> {
  __$$readEventImplCopyWithImpl(
      _$readEventImpl _value, $Res Function(_$readEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$readEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$readEventImpl with DiagnosticableTreeMixin implements _readEvent {
  const _$readEventImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocEvent.read(uuid: $uuid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoBlocEvent.read'))
      ..add(DiagnosticsProperty('uuid', uuid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$readEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$readEventImplCopyWith<_$readEventImpl> get copyWith =>
      __$$readEventImplCopyWithImpl<_$readEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) init,
    required TResult Function(String uuid) read,
    required TResult Function(
            String uuid, String path, Completer<dynamic> completer)
        write,
    required TResult Function(String uuid, Completer<dynamic> completer) delete,
  }) {
    return read(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? init,
    TResult? Function(String uuid)? read,
    TResult? Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult? Function(String uuid, Completer<dynamic> completer)? delete,
  }) {
    return read?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? init,
    TResult Function(String uuid)? read,
    TResult Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult Function(String uuid, Completer<dynamic> completer)? delete,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_writeEvent value) write,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_writeEvent value)? write,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_writeEvent value)? write,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class _readEvent implements PhotoBlocEvent {
  const factory _readEvent({required final String uuid}) = _$readEventImpl;

  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$readEventImplCopyWith<_$readEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$writeEventImplCopyWith<$Res>
    implements $PhotoBlocEventCopyWith<$Res> {
  factory _$$writeEventImplCopyWith(
          _$writeEventImpl value, $Res Function(_$writeEventImpl) then) =
      __$$writeEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String path, Completer<dynamic> completer});
}

/// @nodoc
class __$$writeEventImplCopyWithImpl<$Res>
    extends _$PhotoBlocEventCopyWithImpl<$Res, _$writeEventImpl>
    implements _$$writeEventImplCopyWith<$Res> {
  __$$writeEventImplCopyWithImpl(
      _$writeEventImpl _value, $Res Function(_$writeEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? path = null,
    Object? completer = null,
  }) {
    return _then(_$writeEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$writeEventImpl with DiagnosticableTreeMixin implements _writeEvent {
  const _$writeEventImpl(
      {required this.uuid, required this.path, required this.completer});

  @override
  final String uuid;
  @override
  final String path;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocEvent.write(uuid: $uuid, path: $path, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoBlocEvent.write'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$writeEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, path, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$writeEventImplCopyWith<_$writeEventImpl> get copyWith =>
      __$$writeEventImplCopyWithImpl<_$writeEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) init,
    required TResult Function(String uuid) read,
    required TResult Function(
            String uuid, String path, Completer<dynamic> completer)
        write,
    required TResult Function(String uuid, Completer<dynamic> completer) delete,
  }) {
    return write(uuid, path, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? init,
    TResult? Function(String uuid)? read,
    TResult? Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult? Function(String uuid, Completer<dynamic> completer)? delete,
  }) {
    return write?.call(uuid, path, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? init,
    TResult Function(String uuid)? read,
    TResult Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult Function(String uuid, Completer<dynamic> completer)? delete,
    required TResult orElse(),
  }) {
    if (write != null) {
      return write(uuid, path, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_writeEvent value) write,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return write(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_writeEvent value)? write,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return write?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_writeEvent value)? write,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (write != null) {
      return write(this);
    }
    return orElse();
  }
}

abstract class _writeEvent implements PhotoBlocEvent {
  const factory _writeEvent(
      {required final String uuid,
      required final String path,
      required final Completer<dynamic> completer}) = _$writeEventImpl;

  @override
  String get uuid;
  String get path;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$writeEventImplCopyWith<_$writeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteEventImplCopyWith<$Res>
    implements $PhotoBlocEventCopyWith<$Res> {
  factory _$$deleteEventImplCopyWith(
          _$deleteEventImpl value, $Res Function(_$deleteEventImpl) then) =
      __$$deleteEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, Completer<dynamic> completer});
}

/// @nodoc
class __$$deleteEventImplCopyWithImpl<$Res>
    extends _$PhotoBlocEventCopyWithImpl<$Res, _$deleteEventImpl>
    implements _$$deleteEventImplCopyWith<$Res> {
  __$$deleteEventImplCopyWithImpl(
      _$deleteEventImpl _value, $Res Function(_$deleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? completer = null,
  }) {
    return _then(_$deleteEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$deleteEventImpl with DiagnosticableTreeMixin implements _deleteEvent {
  const _$deleteEventImpl({required this.uuid, required this.completer});

  @override
  final String uuid;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocEvent.delete(uuid: $uuid, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoBlocEvent.delete'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      __$$deleteEventImplCopyWithImpl<_$deleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid) init,
    required TResult Function(String uuid) read,
    required TResult Function(
            String uuid, String path, Completer<dynamic> completer)
        write,
    required TResult Function(String uuid, Completer<dynamic> completer) delete,
  }) {
    return delete(uuid, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid)? init,
    TResult? Function(String uuid)? read,
    TResult? Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult? Function(String uuid, Completer<dynamic> completer)? delete,
  }) {
    return delete?.call(uuid, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid)? init,
    TResult Function(String uuid)? read,
    TResult Function(String uuid, String path, Completer<dynamic> completer)?
        write,
    TResult Function(String uuid, Completer<dynamic> completer)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(uuid, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_writeEvent value) write,
    required TResult Function(_deleteEvent value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_writeEvent value)? write,
    TResult? Function(_deleteEvent value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_writeEvent value)? write,
    TResult Function(_deleteEvent value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _deleteEvent implements PhotoBlocEvent {
  const factory _deleteEvent(
      {required final String uuid,
      required final Completer<dynamic> completer}) = _$deleteEventImpl;

  @override
  String get uuid;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PhotosEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosEntity? entity)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
    required TResult Function(_loadedState value) loaded,
    required TResult Function(_errorState value) error,
    required TResult Function(_timeOut value) timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingState value)? loading,
    TResult? Function(_loadedState value)? loaded,
    TResult? Function(_errorState value)? error,
    TResult? Function(_timeOut value)? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingState value)? loading,
    TResult Function(_loadedState value)? loaded,
    TResult Function(_errorState value)? error,
    TResult Function(_timeOut value)? timeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoBlocStateCopyWith<$Res> {
  factory $PhotoBlocStateCopyWith(
          PhotoBlocState value, $Res Function(PhotoBlocState) then) =
      _$PhotoBlocStateCopyWithImpl<$Res, PhotoBlocState>;
}

/// @nodoc
class _$PhotoBlocStateCopyWithImpl<$Res, $Val extends PhotoBlocState>
    implements $PhotoBlocStateCopyWith<$Res> {
  _$PhotoBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$PhotoBlocStateCopyWithImpl<$Res, _$loadingStateImpl>
    implements _$$loadingStateImplCopyWith<$Res> {
  __$$loadingStateImplCopyWithImpl(
      _$loadingStateImpl _value, $Res Function(_$loadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingStateImpl with DiagnosticableTreeMixin implements _loadingState {
  const _$loadingStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PhotoBlocState.loading'));
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
    required TResult Function(PhotosEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosEntity? entity)? loaded,
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

abstract class _loadingState implements PhotoBlocState {
  const factory _loadingState() = _$loadingStateImpl;
}

/// @nodoc
abstract class _$$loadedStateImplCopyWith<$Res> {
  factory _$$loadedStateImplCopyWith(
          _$loadedStateImpl value, $Res Function(_$loadedStateImpl) then) =
      __$$loadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhotosEntity? entity});
}

/// @nodoc
class __$$loadedStateImplCopyWithImpl<$Res>
    extends _$PhotoBlocStateCopyWithImpl<$Res, _$loadedStateImpl>
    implements _$$loadedStateImplCopyWith<$Res> {
  __$$loadedStateImplCopyWithImpl(
      _$loadedStateImpl _value, $Res Function(_$loadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$loadedStateImpl(
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as PhotosEntity?,
    ));
  }
}

/// @nodoc

class _$loadedStateImpl with DiagnosticableTreeMixin implements _loadedState {
  const _$loadedStateImpl({required this.entity});

  @override
  final PhotosEntity? entity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocState.loaded(entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoBlocState.loaded'))
      ..add(DiagnosticsProperty('entity', entity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loadedStateImpl &&
            (identical(other.entity, entity) || other.entity == entity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loadedStateImplCopyWith<_$loadedStateImpl> get copyWith =>
      __$$loadedStateImplCopyWithImpl<_$loadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(PhotosEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosEntity? entity)? loaded,
    TResult Function()? error,
    TResult Function()? timeOut,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingState value) loading,
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

abstract class _loadedState implements PhotoBlocState {
  const factory _loadedState({required final PhotosEntity? entity}) =
      _$loadedStateImpl;

  PhotosEntity? get entity;
  @JsonKey(ignore: true)
  _$$loadedStateImplCopyWith<_$loadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorStateImplCopyWith<$Res> {
  factory _$$errorStateImplCopyWith(
          _$errorStateImpl value, $Res Function(_$errorStateImpl) then) =
      __$$errorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$errorStateImplCopyWithImpl<$Res>
    extends _$PhotoBlocStateCopyWithImpl<$Res, _$errorStateImpl>
    implements _$$errorStateImplCopyWith<$Res> {
  __$$errorStateImplCopyWithImpl(
      _$errorStateImpl _value, $Res Function(_$errorStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$errorStateImpl with DiagnosticableTreeMixin implements _errorState {
  const _$errorStateImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PhotoBlocState.error'));
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
    required TResult Function(PhotosEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosEntity? entity)? loaded,
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

abstract class _errorState implements PhotoBlocState {
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
    extends _$PhotoBlocStateCopyWithImpl<$Res, _$timeOutImpl>
    implements _$$timeOutImplCopyWith<$Res> {
  __$$timeOutImplCopyWithImpl(
      _$timeOutImpl _value, $Res Function(_$timeOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$timeOutImpl with DiagnosticableTreeMixin implements _timeOut {
  const _$timeOutImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoBlocState.timeOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PhotoBlocState.timeOut'));
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
    required TResult Function(PhotosEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(PhotosEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(PhotosEntity? entity)? loaded,
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

abstract class _timeOut implements PhotoBlocState {
  const factory _timeOut() = _$timeOutImpl;
}
