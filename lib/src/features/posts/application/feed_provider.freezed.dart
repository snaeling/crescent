// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'feed_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedState {
  int? get id => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  DateTime? get initiated => throw _privateConstructorUsedError;

  /// Is true if the feed has exhausted itself.
  bool get isDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedStateCopyWith<FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedStateCopyWith<$Res> {
  factory $FeedStateCopyWith(FeedState value, $Res Function(FeedState) then) =
      _$FeedStateCopyWithImpl<$Res, FeedState>;
  @useResult
  $Res call(
      {int? id,
      int page,
      List<Post> posts,
      bool isLoading,
      bool isError,
      DateTime? initiated,
      bool isDone});
}

/// @nodoc
class _$FeedStateCopyWithImpl<$Res, $Val extends FeedState>
    implements $FeedStateCopyWith<$Res> {
  _$FeedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? page = null,
    Object? posts = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? initiated = freezed,
    Object? isDone = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      initiated: freezed == initiated
          ? _value.initiated
          : initiated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedStateCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$$_FeedStateCopyWith(
          _$_FeedState value, $Res Function(_$_FeedState) then) =
      __$$_FeedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int page,
      List<Post> posts,
      bool isLoading,
      bool isError,
      DateTime? initiated,
      bool isDone});
}

/// @nodoc
class __$$_FeedStateCopyWithImpl<$Res>
    extends _$FeedStateCopyWithImpl<$Res, _$_FeedState>
    implements _$$_FeedStateCopyWith<$Res> {
  __$$_FeedStateCopyWithImpl(
      _$_FeedState _value, $Res Function(_$_FeedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? page = null,
    Object? posts = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? initiated = freezed,
    Object? isDone = null,
  }) {
    return _then(_$_FeedState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      initiated: freezed == initiated
          ? _value.initiated
          : initiated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FeedState extends _FeedState with DiagnosticableTreeMixin {
  const _$_FeedState(
      {this.id,
      this.page = 0,
      final List<Post> posts = const [],
      this.isLoading = true,
      this.isError = false,
      this.initiated,
      this.isDone = false})
      : _posts = posts,
        super._();

  @override
  final int? id;
  @override
  @JsonKey()
  final int page;
  final List<Post> _posts;
  @override
  @JsonKey()
  List<Post> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  final DateTime? initiated;

  /// Is true if the feed has exhausted itself.
  @override
  @JsonKey()
  final bool isDone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FeedState(id: $id, page: $page, posts: $posts, isLoading: $isLoading, isError: $isError, initiated: $initiated, isDone: $isDone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FeedState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isError', isError))
      ..add(DiagnosticsProperty('initiated', initiated))
      ..add(DiagnosticsProperty('isDone', isDone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.initiated, initiated) ||
                other.initiated == initiated) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      page,
      const DeepCollectionEquality().hash(_posts),
      isLoading,
      isError,
      initiated,
      isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      __$$_FeedStateCopyWithImpl<_$_FeedState>(this, _$identity);
}

abstract class _FeedState extends FeedState {
  const factory _FeedState(
      {final int? id,
      final int page,
      final List<Post> posts,
      final bool isLoading,
      final bool isError,
      final DateTime? initiated,
      final bool isDone}) = _$_FeedState;
  const _FeedState._() : super._();

  @override
  int? get id;
  @override
  int get page;
  @override
  List<Post> get posts;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  DateTime? get initiated;
  @override

  /// Is true if the feed has exhausted itself.
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}
