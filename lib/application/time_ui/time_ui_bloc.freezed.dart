// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_ui_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? changeState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeState value) changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeState value)? changeState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeState value)? changeState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeUiEventCopyWith<$Res> {
  factory $TimeUiEventCopyWith(
          TimeUiEvent value, $Res Function(TimeUiEvent) then) =
      _$TimeUiEventCopyWithImpl<$Res, TimeUiEvent>;
}

/// @nodoc
class _$TimeUiEventCopyWithImpl<$Res, $Val extends TimeUiEvent>
    implements $TimeUiEventCopyWith<$Res> {
  _$TimeUiEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeStateImplCopyWith<$Res> {
  factory _$$ChangeStateImplCopyWith(
          _$ChangeStateImpl value, $Res Function(_$ChangeStateImpl) then) =
      __$$ChangeStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeStateImplCopyWithImpl<$Res>
    extends _$TimeUiEventCopyWithImpl<$Res, _$ChangeStateImpl>
    implements _$$ChangeStateImplCopyWith<$Res> {
  __$$ChangeStateImplCopyWithImpl(
      _$ChangeStateImpl _value, $Res Function(_$ChangeStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeStateImpl implements ChangeState {
  const _$ChangeStateImpl();

  @override
  String toString() {
    return 'TimeUiEvent.changeState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() changeState,
  }) {
    return changeState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? changeState,
  }) {
    return changeState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? changeState,
    required TResult orElse(),
  }) {
    if (changeState != null) {
      return changeState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeState value) changeState,
  }) {
    return changeState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChangeState value)? changeState,
  }) {
    return changeState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeState value)? changeState,
    required TResult orElse(),
  }) {
    if (changeState != null) {
      return changeState(this);
    }
    return orElse();
  }
}

abstract class ChangeState implements TimeUiEvent {
  const factory ChangeState() = _$ChangeStateImpl;
}

/// @nodoc
mixin _$TimeUiState {
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeUiStateCopyWith<TimeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeUiStateCopyWith<$Res> {
  factory $TimeUiStateCopyWith(
          TimeUiState value, $Res Function(TimeUiState) then) =
      _$TimeUiStateCopyWithImpl<$Res, TimeUiState>;
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class _$TimeUiStateCopyWithImpl<$Res, $Val extends TimeUiState>
    implements $TimeUiStateCopyWith<$Res> {
  _$TimeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeUiStateImplCopyWith<$Res>
    implements $TimeUiStateCopyWith<$Res> {
  factory _$$TimeUiStateImplCopyWith(
          _$TimeUiStateImpl value, $Res Function(_$TimeUiStateImpl) then) =
      __$$TimeUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class __$$TimeUiStateImplCopyWithImpl<$Res>
    extends _$TimeUiStateCopyWithImpl<$Res, _$TimeUiStateImpl>
    implements _$$TimeUiStateImplCopyWith<$Res> {
  __$$TimeUiStateImplCopyWithImpl(
      _$TimeUiStateImpl _value, $Res Function(_$TimeUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$TimeUiStateImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$TimeUiStateImpl implements _TimeUiState {
  const _$TimeUiStateImpl({required this.time});

  @override
  final DateTime time;

  @override
  String toString() {
    return 'TimeUiState(time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeUiStateImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeUiStateImplCopyWith<_$TimeUiStateImpl> get copyWith =>
      __$$TimeUiStateImplCopyWithImpl<_$TimeUiStateImpl>(this, _$identity);
}

abstract class _TimeUiState implements TimeUiState {
  const factory _TimeUiState({required final DateTime time}) =
      _$TimeUiStateImpl;

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$TimeUiStateImplCopyWith<_$TimeUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
