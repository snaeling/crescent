// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppUserState {
  User? get user => throw _privateConstructorUsedError;
  bool get loggedIn => throw _privateConstructorUsedError;
  UserState? get userState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppUserStateCopyWith<AppUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserStateCopyWith<$Res> {
  factory $AppUserStateCopyWith(
          AppUserState value, $Res Function(AppUserState) then) =
      _$AppUserStateCopyWithImpl<$Res, AppUserState>;
  @useResult
  $Res call({User? user, bool loggedIn, UserState? userState});

  $UserCopyWith<$Res>? get user;
  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class _$AppUserStateCopyWithImpl<$Res, $Val extends AppUserState>
    implements $AppUserStateCopyWith<$Res> {
  _$AppUserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? loggedIn = null,
    Object? userState = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserStateCopyWith<$Res>? get userState {
    if (_value.userState == null) {
      return null;
    }

    return $UserStateCopyWith<$Res>(_value.userState!, (value) {
      return _then(_value.copyWith(userState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppUserStateCopyWith<$Res>
    implements $AppUserStateCopyWith<$Res> {
  factory _$$_AppUserStateCopyWith(
          _$_AppUserState value, $Res Function(_$_AppUserState) then) =
      __$$_AppUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, bool loggedIn, UserState? userState});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $UserStateCopyWith<$Res>? get userState;
}

/// @nodoc
class __$$_AppUserStateCopyWithImpl<$Res>
    extends _$AppUserStateCopyWithImpl<$Res, _$_AppUserState>
    implements _$$_AppUserStateCopyWith<$Res> {
  __$$_AppUserStateCopyWithImpl(
      _$_AppUserState _value, $Res Function(_$_AppUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? loggedIn = null,
    Object? userState = freezed,
  }) {
    return _then(_$_AppUserState(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userState: freezed == userState
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as UserState?,
    ));
  }
}

/// @nodoc

class _$_AppUserState extends _AppUserState {
  const _$_AppUserState({this.user, this.loggedIn = false, this.userState})
      : super._();

  @override
  final User? user;
  @override
  @JsonKey()
  final bool loggedIn;
  @override
  final UserState? userState;

  @override
  String toString() {
    return 'AppUserState(user: $user, loggedIn: $loggedIn, userState: $userState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.userState, userState) ||
                other.userState == userState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, loggedIn, userState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserStateCopyWith<_$_AppUserState> get copyWith =>
      __$$_AppUserStateCopyWithImpl<_$_AppUserState>(this, _$identity);
}

abstract class _AppUserState extends AppUserState {
  const factory _AppUserState(
      {final User? user,
      final bool loggedIn,
      final UserState? userState}) = _$_AppUserState;
  const _AppUserState._() : super._();

  @override
  User? get user;
  @override
  bool get loggedIn;
  @override
  UserState? get userState;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserStateCopyWith<_$_AppUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
