// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_expenses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MonthlyExpensesBlocEvent {
  String get uuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthlyExpensesBlocEventCopyWith<MonthlyExpensesBlocEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory $MonthlyExpensesBlocEventCopyWith(MonthlyExpensesBlocEvent value,
          $Res Function(MonthlyExpensesBlocEvent) then) =
      _$MonthlyExpensesBlocEventCopyWithImpl<$Res, MonthlyExpensesBlocEvent>;
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class _$MonthlyExpensesBlocEventCopyWithImpl<$Res,
        $Val extends MonthlyExpensesBlocEvent>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  _$MonthlyExpensesBlocEventCopyWithImpl(this._value, this._then);

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
abstract class _$$addEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$addEventImplCopyWith(
          _$addEventImpl value, $Res Function(_$addEventImpl) then) =
      __$$addEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, DayExpense data, Completer<dynamic> completer});
}

/// @nodoc
class __$$addEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$addEventImpl>
    implements _$$addEventImplCopyWith<$Res> {
  __$$addEventImplCopyWithImpl(
      _$addEventImpl _value, $Res Function(_$addEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? data = null,
    Object? completer = null,
  }) {
    return _then(_$addEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DayExpense,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$addEventImpl with DiagnosticableTreeMixin implements _addEvent {
  const _$addEventImpl(
      {required this.uuid, required this.data, required this.completer});

  @override
  final String uuid;
  @override
  final DayExpense data;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.add(uuid: $uuid, data: $data, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.add'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, data, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addEventImplCopyWith<_$addEventImpl> get copyWith =>
      __$$addEventImplCopyWithImpl<_$addEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return add(uuid, data, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return add?.call(uuid, data, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(uuid, data, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _addEvent implements MonthlyExpensesBlocEvent {
  const factory _addEvent(
      {required final String uuid,
      required final DayExpense data,
      required final Completer<dynamic> completer}) = _$addEventImpl;

  @override
  String get uuid;
  DayExpense get data;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$addEventImplCopyWith<_$addEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$readTotalEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$readTotalEventImplCopyWith(_$readTotalEventImpl value,
          $Res Function(_$readTotalEventImpl) then) =
      __$$readTotalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid, int idMonth, int idCategory, Completer<dynamic> completer});
}

/// @nodoc
class __$$readTotalEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$readTotalEventImpl>
    implements _$$readTotalEventImplCopyWith<$Res> {
  __$$readTotalEventImplCopyWithImpl(
      _$readTotalEventImpl _value, $Res Function(_$readTotalEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? idMonth = null,
    Object? idCategory = null,
    Object? completer = null,
  }) {
    return _then(_$readTotalEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      idMonth: null == idMonth
          ? _value.idMonth
          : idMonth // ignore: cast_nullable_to_non_nullable
              as int,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$readTotalEventImpl
    with DiagnosticableTreeMixin
    implements _readTotalEvent {
  const _$readTotalEventImpl(
      {required this.uuid,
      required this.idMonth,
      required this.idCategory,
      required this.completer});

  @override
  final String uuid;
  @override
  final int idMonth;
  @override
  final int idCategory;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.readTotal(uuid: $uuid, idMonth: $idMonth, idCategory: $idCategory, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.readTotal'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('idMonth', idMonth))
      ..add(DiagnosticsProperty('idCategory', idCategory))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$readTotalEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.idMonth, idMonth) || other.idMonth == idMonth) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, idMonth, idCategory, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$readTotalEventImplCopyWith<_$readTotalEventImpl> get copyWith =>
      __$$readTotalEventImplCopyWithImpl<_$readTotalEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return readTotal(uuid, idMonth, idCategory, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return readTotal?.call(uuid, idMonth, idCategory, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (readTotal != null) {
      return readTotal(uuid, idMonth, idCategory, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return readTotal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return readTotal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (readTotal != null) {
      return readTotal(this);
    }
    return orElse();
  }
}

abstract class _readTotalEvent implements MonthlyExpensesBlocEvent {
  const factory _readTotalEvent(
      {required final String uuid,
      required final int idMonth,
      required final int idCategory,
      required final Completer<dynamic> completer}) = _$readTotalEventImpl;

  @override
  String get uuid;
  int get idMonth;
  int get idCategory;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$readTotalEventImplCopyWith<_$readTotalEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteWithCategoryEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$deleteWithCategoryEventImplCopyWith(
          _$deleteWithCategoryEventImpl value,
          $Res Function(_$deleteWithCategoryEventImpl) then) =
      __$$deleteWithCategoryEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int idCategory});
}

/// @nodoc
class __$$deleteWithCategoryEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res,
        _$deleteWithCategoryEventImpl>
    implements _$$deleteWithCategoryEventImplCopyWith<$Res> {
  __$$deleteWithCategoryEventImplCopyWithImpl(
      _$deleteWithCategoryEventImpl _value,
      $Res Function(_$deleteWithCategoryEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? idCategory = null,
  }) {
    return _then(_$deleteWithCategoryEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$deleteWithCategoryEventImpl
    with DiagnosticableTreeMixin
    implements _deleteWithCategoryEvent {
  const _$deleteWithCategoryEventImpl(
      {required this.uuid, required this.idCategory});

  @override
  final String uuid;
  @override
  final int idCategory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.deleteWithCategory(uuid: $uuid, idCategory: $idCategory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'MonthlyExpensesBlocEvent.deleteWithCategory'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('idCategory', idCategory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteWithCategoryEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, idCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteWithCategoryEventImplCopyWith<_$deleteWithCategoryEventImpl>
      get copyWith => __$$deleteWithCategoryEventImplCopyWithImpl<
          _$deleteWithCategoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return deleteWithCategory(uuid, idCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return deleteWithCategory?.call(uuid, idCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (deleteWithCategory != null) {
      return deleteWithCategory(uuid, idCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return deleteWithCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return deleteWithCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (deleteWithCategory != null) {
      return deleteWithCategory(this);
    }
    return orElse();
  }
}

abstract class _deleteWithCategoryEvent implements MonthlyExpensesBlocEvent {
  const factory _deleteWithCategoryEvent(
      {required final String uuid,
      required final int idCategory}) = _$deleteWithCategoryEventImpl;

  @override
  String get uuid;
  int get idCategory;
  @override
  @JsonKey(ignore: true)
  _$$deleteWithCategoryEventImplCopyWith<_$deleteWithCategoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$initEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$initEventImplCopyWith(
          _$initEventImpl value, $Res Function(_$initEventImpl) then) =
      __$$initEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int idMonth, int idCategory});
}

/// @nodoc
class __$$initEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$initEventImpl>
    implements _$$initEventImplCopyWith<$Res> {
  __$$initEventImplCopyWithImpl(
      _$initEventImpl _value, $Res Function(_$initEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? idMonth = null,
    Object? idCategory = null,
  }) {
    return _then(_$initEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      idMonth: null == idMonth
          ? _value.idMonth
          : idMonth // ignore: cast_nullable_to_non_nullable
              as int,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$initEventImpl with DiagnosticableTreeMixin implements _initEvent {
  const _$initEventImpl(
      {required this.uuid, required this.idMonth, required this.idCategory});

  @override
  final String uuid;
  @override
  final int idMonth;
  @override
  final int idCategory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.init(uuid: $uuid, idMonth: $idMonth, idCategory: $idCategory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.init'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('idMonth', idMonth))
      ..add(DiagnosticsProperty('idCategory', idCategory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.idMonth, idMonth) || other.idMonth == idMonth) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, idMonth, idCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      __$$initEventImplCopyWithImpl<_$initEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return init(uuid, idMonth, idCategory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return init?.call(uuid, idMonth, idCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(uuid, idMonth, idCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _initEvent implements MonthlyExpensesBlocEvent {
  const factory _initEvent(
      {required final String uuid,
      required final int idMonth,
      required final int idCategory}) = _$initEventImpl;

  @override
  String get uuid;
  int get idMonth;
  int get idCategory;
  @override
  @JsonKey(ignore: true)
  _$$initEventImplCopyWith<_$initEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$readEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$readEventImplCopyWith(
          _$readEventImpl value, $Res Function(_$readEventImpl) then) =
      __$$readEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      int idMonth,
      int idCategory,
      Completer<dynamic>? completer});
}

/// @nodoc
class __$$readEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$readEventImpl>
    implements _$$readEventImplCopyWith<$Res> {
  __$$readEventImplCopyWithImpl(
      _$readEventImpl _value, $Res Function(_$readEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? idMonth = null,
    Object? idCategory = null,
    Object? completer = freezed,
  }) {
    return _then(_$readEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      idMonth: null == idMonth
          ? _value.idMonth
          : idMonth // ignore: cast_nullable_to_non_nullable
              as int,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as int,
      completer: freezed == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>?,
    ));
  }
}

/// @nodoc

class _$readEventImpl with DiagnosticableTreeMixin implements _readEvent {
  const _$readEventImpl(
      {required this.uuid,
      required this.idMonth,
      required this.idCategory,
      this.completer});

  @override
  final String uuid;
  @override
  final int idMonth;
  @override
  final int idCategory;
  @override
  final Completer<dynamic>? completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.read(uuid: $uuid, idMonth: $idMonth, idCategory: $idCategory, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.read'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('idMonth', idMonth))
      ..add(DiagnosticsProperty('idCategory', idCategory))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$readEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.idMonth, idMonth) || other.idMonth == idMonth) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, idMonth, idCategory, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$readEventImplCopyWith<_$readEventImpl> get copyWith =>
      __$$readEventImplCopyWithImpl<_$readEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return read(uuid, idMonth, idCategory, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return read?.call(uuid, idMonth, idCategory, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(uuid, idMonth, idCategory, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }
}

abstract class _readEvent implements MonthlyExpensesBlocEvent {
  const factory _readEvent(
      {required final String uuid,
      required final int idMonth,
      required final int idCategory,
      final Completer<dynamic>? completer}) = _$readEventImpl;

  @override
  String get uuid;
  int get idMonth;
  int get idCategory;
  Completer<dynamic>? get completer;
  @override
  @JsonKey(ignore: true)
  _$$readEventImplCopyWith<_$readEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$deleteEventImplCopyWith(
          _$deleteEventImpl value, $Res Function(_$deleteEventImpl) then) =
      __$$deleteEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid});
}

/// @nodoc
class __$$deleteEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$deleteEventImpl>
    implements _$$deleteEventImplCopyWith<$Res> {
  __$$deleteEventImplCopyWithImpl(
      _$deleteEventImpl _value, $Res Function(_$deleteEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
  }) {
    return _then(_$deleteEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$deleteEventImpl with DiagnosticableTreeMixin implements _deleteEvent {
  const _$deleteEventImpl({required this.uuid});

  @override
  final String uuid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.delete(uuid: $uuid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.delete'))
      ..add(DiagnosticsProperty('uuid', uuid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      __$$deleteEventImplCopyWithImpl<_$deleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return delete(uuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return delete?.call(uuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(uuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _deleteEvent implements MonthlyExpensesBlocEvent {
  const factory _deleteEvent({required final String uuid}) = _$deleteEventImpl;

  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$deleteEventImplCopyWith<_$deleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$deleteIdEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$deleteIdEventImplCopyWith(
          _$deleteIdEventImpl value, $Res Function(_$deleteIdEventImpl) then) =
      __$$deleteIdEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int id});
}

/// @nodoc
class __$$deleteIdEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$deleteIdEventImpl>
    implements _$$deleteIdEventImplCopyWith<$Res> {
  __$$deleteIdEventImplCopyWithImpl(
      _$deleteIdEventImpl _value, $Res Function(_$deleteIdEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? id = null,
  }) {
    return _then(_$deleteIdEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$deleteIdEventImpl
    with DiagnosticableTreeMixin
    implements _deleteIdEvent {
  const _$deleteIdEventImpl({required this.uuid, required this.id});

  @override
  final String uuid;
  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.deleteId(uuid: $uuid, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.deleteId'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteIdEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteIdEventImplCopyWith<_$deleteIdEventImpl> get copyWith =>
      __$$deleteIdEventImplCopyWithImpl<_$deleteIdEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return deleteId(uuid, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return deleteId?.call(uuid, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (deleteId != null) {
      return deleteId(uuid, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return deleteId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return deleteId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (deleteId != null) {
      return deleteId(this);
    }
    return orElse();
  }
}

abstract class _deleteIdEvent implements MonthlyExpensesBlocEvent {
  const factory _deleteIdEvent(
      {required final String uuid,
      required final int id}) = _$deleteIdEventImpl;

  @override
  String get uuid;
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$deleteIdEventImplCopyWith<_$deleteIdEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$updateEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$updateEventImplCopyWith(
          _$updateEventImpl value, $Res Function(_$updateEventImpl) then) =
      __$$updateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, DayExpense data, Completer<dynamic> completer});
}

/// @nodoc
class __$$updateEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res, _$updateEventImpl>
    implements _$$updateEventImplCopyWith<$Res> {
  __$$updateEventImplCopyWithImpl(
      _$updateEventImpl _value, $Res Function(_$updateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? data = null,
    Object? completer = null,
  }) {
    return _then(_$updateEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DayExpense,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$updateEventImpl with DiagnosticableTreeMixin implements _updateEvent {
  const _$updateEventImpl(
      {required this.uuid, required this.data, required this.completer});

  @override
  final String uuid;
  @override
  final DayExpense data;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.update(uuid: $uuid, data: $data, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.update'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, data, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateEventImplCopyWith<_$updateEventImpl> get copyWith =>
      __$$updateEventImplCopyWithImpl<_$updateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return update(uuid, data, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return update?.call(uuid, data, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(uuid, data, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _updateEvent implements MonthlyExpensesBlocEvent {
  const factory _updateEvent(
      {required final String uuid,
      required final DayExpense data,
      required final Completer<dynamic> completer}) = _$updateEventImpl;

  @override
  String get uuid;
  DayExpense get data;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$updateEventImplCopyWith<_$updateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$readWithMonthEventImplCopyWith<$Res>
    implements $MonthlyExpensesBlocEventCopyWith<$Res> {
  factory _$$readWithMonthEventImplCopyWith(_$readWithMonthEventImpl value,
          $Res Function(_$readWithMonthEventImpl) then) =
      __$$readWithMonthEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, int idMonth, Completer<dynamic> completer});
}

/// @nodoc
class __$$readWithMonthEventImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocEventCopyWithImpl<$Res,
        _$readWithMonthEventImpl>
    implements _$$readWithMonthEventImplCopyWith<$Res> {
  __$$readWithMonthEventImplCopyWithImpl(_$readWithMonthEventImpl _value,
      $Res Function(_$readWithMonthEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? idMonth = null,
    Object? completer = null,
  }) {
    return _then(_$readWithMonthEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      idMonth: null == idMonth
          ? _value.idMonth
          : idMonth // ignore: cast_nullable_to_non_nullable
              as int,
      completer: null == completer
          ? _value.completer
          : completer // ignore: cast_nullable_to_non_nullable
              as Completer<dynamic>,
    ));
  }
}

/// @nodoc

class _$readWithMonthEventImpl
    with DiagnosticableTreeMixin
    implements _readWithMonthEvent {
  const _$readWithMonthEventImpl(
      {required this.uuid, required this.idMonth, required this.completer});

  @override
  final String uuid;
  @override
  final int idMonth;
  @override
  final Completer<dynamic> completer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocEvent.readWithMonth(uuid: $uuid, idMonth: $idMonth, completer: $completer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'MonthlyExpensesBlocEvent.readWithMonth'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('idMonth', idMonth))
      ..add(DiagnosticsProperty('completer', completer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$readWithMonthEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.idMonth, idMonth) || other.idMonth == idMonth) &&
            (identical(other.completer, completer) ||
                other.completer == completer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, idMonth, completer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$readWithMonthEventImplCopyWith<_$readWithMonthEventImpl> get copyWith =>
      __$$readWithMonthEventImplCopyWithImpl<_$readWithMonthEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        add,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)
        readTotal,
    required TResult Function(String uuid, int idCategory) deleteWithCategory,
    required TResult Function(String uuid, int idMonth, int idCategory) init,
    required TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)
        read,
    required TResult Function(String uuid) delete,
    required TResult Function(String uuid, int id) deleteId,
    required TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)
        update,
    required TResult Function(
            String uuid, int idMonth, Completer<dynamic> completer)
        readWithMonth,
  }) {
    return readWithMonth(uuid, idMonth, completer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult? Function(String uuid, int idCategory)? deleteWithCategory,
    TResult? Function(String uuid, int idMonth, int idCategory)? init,
    TResult? Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult? Function(String uuid)? delete,
    TResult? Function(String uuid, int id)? deleteId,
    TResult? Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult? Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
  }) {
    return readWithMonth?.call(uuid, idMonth, completer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        add,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic> completer)?
        readTotal,
    TResult Function(String uuid, int idCategory)? deleteWithCategory,
    TResult Function(String uuid, int idMonth, int idCategory)? init,
    TResult Function(String uuid, int idMonth, int idCategory,
            Completer<dynamic>? completer)?
        read,
    TResult Function(String uuid)? delete,
    TResult Function(String uuid, int id)? deleteId,
    TResult Function(
            String uuid, DayExpense data, Completer<dynamic> completer)?
        update,
    TResult Function(String uuid, int idMonth, Completer<dynamic> completer)?
        readWithMonth,
    required TResult orElse(),
  }) {
    if (readWithMonth != null) {
      return readWithMonth(uuid, idMonth, completer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_addEvent value) add,
    required TResult Function(_readTotalEvent value) readTotal,
    required TResult Function(_deleteWithCategoryEvent value)
        deleteWithCategory,
    required TResult Function(_initEvent value) init,
    required TResult Function(_readEvent value) read,
    required TResult Function(_deleteEvent value) delete,
    required TResult Function(_deleteIdEvent value) deleteId,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_readWithMonthEvent value) readWithMonth,
  }) {
    return readWithMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_addEvent value)? add,
    TResult? Function(_readTotalEvent value)? readTotal,
    TResult? Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult? Function(_initEvent value)? init,
    TResult? Function(_readEvent value)? read,
    TResult? Function(_deleteEvent value)? delete,
    TResult? Function(_deleteIdEvent value)? deleteId,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_readWithMonthEvent value)? readWithMonth,
  }) {
    return readWithMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_addEvent value)? add,
    TResult Function(_readTotalEvent value)? readTotal,
    TResult Function(_deleteWithCategoryEvent value)? deleteWithCategory,
    TResult Function(_initEvent value)? init,
    TResult Function(_readEvent value)? read,
    TResult Function(_deleteEvent value)? delete,
    TResult Function(_deleteIdEvent value)? deleteId,
    TResult Function(_updateEvent value)? update,
    TResult Function(_readWithMonthEvent value)? readWithMonth,
    required TResult orElse(),
  }) {
    if (readWithMonth != null) {
      return readWithMonth(this);
    }
    return orElse();
  }
}

abstract class _readWithMonthEvent implements MonthlyExpensesBlocEvent {
  const factory _readWithMonthEvent(
      {required final String uuid,
      required final int idMonth,
      required final Completer<dynamic> completer}) = _$readWithMonthEventImpl;

  @override
  String get uuid;
  int get idMonth;
  Completer<dynamic> get completer;
  @override
  @JsonKey(ignore: true)
  _$$readWithMonthEventImplCopyWith<_$readWithMonthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyExpensesBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(MonthlyExpensesEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MonthlyExpensesEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MonthlyExpensesEntity? entity)? loaded,
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
abstract class $MonthlyExpensesBlocStateCopyWith<$Res> {
  factory $MonthlyExpensesBlocStateCopyWith(MonthlyExpensesBlocState value,
          $Res Function(MonthlyExpensesBlocState) then) =
      _$MonthlyExpensesBlocStateCopyWithImpl<$Res, MonthlyExpensesBlocState>;
}

/// @nodoc
class _$MonthlyExpensesBlocStateCopyWithImpl<$Res,
        $Val extends MonthlyExpensesBlocState>
    implements $MonthlyExpensesBlocStateCopyWith<$Res> {
  _$MonthlyExpensesBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$MonthlyExpensesBlocStateCopyWithImpl<$Res, _$loadingStateImpl>
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
    return 'MonthlyExpensesBlocState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'MonthlyExpensesBlocState.loading'));
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
    required TResult Function(MonthlyExpensesEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MonthlyExpensesEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MonthlyExpensesEntity? entity)? loaded,
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

abstract class _loadingState implements MonthlyExpensesBlocState {
  const factory _loadingState() = _$loadingStateImpl;
}

/// @nodoc
abstract class _$$loadedStateImplCopyWith<$Res> {
  factory _$$loadedStateImplCopyWith(
          _$loadedStateImpl value, $Res Function(_$loadedStateImpl) then) =
      __$$loadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MonthlyExpensesEntity? entity});
}

/// @nodoc
class __$$loadedStateImplCopyWithImpl<$Res>
    extends _$MonthlyExpensesBlocStateCopyWithImpl<$Res, _$loadedStateImpl>
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
              as MonthlyExpensesEntity?,
    ));
  }
}

/// @nodoc

class _$loadedStateImpl with DiagnosticableTreeMixin implements _loadedState {
  const _$loadedStateImpl({required this.entity});

  @override
  final MonthlyExpensesEntity? entity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MonthlyExpensesBlocState.loaded(entity: $entity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthlyExpensesBlocState.loaded'))
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
    required TResult Function(MonthlyExpensesEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return loaded(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MonthlyExpensesEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return loaded?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MonthlyExpensesEntity? entity)? loaded,
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

abstract class _loadedState implements MonthlyExpensesBlocState {
  const factory _loadedState({required final MonthlyExpensesEntity? entity}) =
      _$loadedStateImpl;

  MonthlyExpensesEntity? get entity;
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
    extends _$MonthlyExpensesBlocStateCopyWithImpl<$Res, _$errorStateImpl>
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
    return 'MonthlyExpensesBlocState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'MonthlyExpensesBlocState.error'));
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
    required TResult Function(MonthlyExpensesEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MonthlyExpensesEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MonthlyExpensesEntity? entity)? loaded,
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

abstract class _errorState implements MonthlyExpensesBlocState {
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
    extends _$MonthlyExpensesBlocStateCopyWithImpl<$Res, _$timeOutImpl>
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
    return 'MonthlyExpensesBlocState.timeOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'MonthlyExpensesBlocState.timeOut'));
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
    required TResult Function(MonthlyExpensesEntity? entity) loaded,
    required TResult Function() error,
    required TResult Function() timeOut,
  }) {
    return timeOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(MonthlyExpensesEntity? entity)? loaded,
    TResult? Function()? error,
    TResult? Function()? timeOut,
  }) {
    return timeOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(MonthlyExpensesEntity? entity)? loaded,
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

abstract class _timeOut implements MonthlyExpensesBlocState {
  const factory _timeOut() = _$timeOutImpl;
}
