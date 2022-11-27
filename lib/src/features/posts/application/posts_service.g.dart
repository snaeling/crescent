// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $postsServiceHash() => r'874871aa04e7cf63efd1f00ec5ec75c99c2a910c';

/// See also [postsService].
final postsServiceProvider = Provider<PostsService>(
  postsService,
  name: r'postsServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $postsServiceHash,
);
typedef PostsServiceRef = ProviderRef<PostsService>;
String $fetchSinglePostHash() => r'9c9b1cd06bff7050b54e35980f588986a271eb85';

/// See also [fetchSinglePost].
class FetchSinglePostProvider extends AutoDisposeFutureProvider<SinglePost> {
  FetchSinglePostProvider(
    this.handle,
    this.id,
  ) : super(
          (ref) => fetchSinglePost(
            ref,
            handle,
            id,
          ),
          from: fetchSinglePostProvider,
          name: r'fetchSinglePostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchSinglePostHash,
        );

  final String handle;
  final int id;

  @override
  bool operator ==(Object other) {
    return other is FetchSinglePostProvider &&
        other.handle == handle &&
        other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, handle.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchSinglePostRef = AutoDisposeFutureProviderRef<SinglePost>;

/// See also [fetchSinglePost].
final fetchSinglePostProvider = FetchSinglePostFamily();

class FetchSinglePostFamily extends Family<AsyncValue<SinglePost>> {
  FetchSinglePostFamily();

  FetchSinglePostProvider call(
    String handle,
    int id,
  ) {
    return FetchSinglePostProvider(
      handle,
      id,
    );
  }

  @override
  AutoDisposeFutureProvider<SinglePost> getProviderOverride(
    covariant FetchSinglePostProvider provider,
  ) {
    return call(
      provider.handle,
      provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchSinglePostProvider';
}

String $fetchProfilePostsHash() => r'0e02ead5345e02277352792fbefc24e5eb8975d5';

/// See also [fetchProfilePosts].
class FetchProfilePostsProvider extends FutureProvider<List<Post>> {
  FetchProfilePostsProvider({
    required this.handle,
    required this.page,
  }) : super(
          (ref) => fetchProfilePosts(
            ref,
            handle: handle,
            page: page,
          ),
          from: fetchProfilePostsProvider,
          name: r'fetchProfilePostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchProfilePostsHash,
        );

  final String handle;
  final int page;

  @override
  bool operator ==(Object other) {
    return other is FetchProfilePostsProvider &&
        other.handle == handle &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, handle.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchProfilePostsRef = FutureProviderRef<List<Post>>;

/// See also [fetchProfilePosts].
final fetchProfilePostsProvider = FetchProfilePostsFamily();

class FetchProfilePostsFamily extends Family<AsyncValue<List<Post>>> {
  FetchProfilePostsFamily();

  FetchProfilePostsProvider call({
    required String handle,
    required int page,
  }) {
    return FetchProfilePostsProvider(
      handle: handle,
      page: page,
    );
  }

  @override
  FutureProvider<List<Post>> getProviderOverride(
    covariant FetchProfilePostsProvider provider,
  ) {
    return call(
      handle: provider.handle,
      page: provider.page,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchProfilePostsProvider';
}

String $fetchHomeFeedPostsHash() => r'fd9b8747836d540636b30181ec96827c3eb4efca';

/// See also [fetchHomeFeedPosts].
class FetchHomeFeedPostsProvider extends FutureProvider<List<Post>> {
  FetchHomeFeedPostsProvider({
    this.timestamp,
    this.skip,
  }) : super(
          (ref) => fetchHomeFeedPosts(
            ref,
            timestamp: timestamp,
            skip: skip,
          ),
          from: fetchHomeFeedPostsProvider,
          name: r'fetchHomeFeedPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchHomeFeedPostsHash,
        );

  final DateTime? timestamp;
  final int? skip;

  @override
  bool operator ==(Object other) {
    return other is FetchHomeFeedPostsProvider &&
        other.timestamp == timestamp &&
        other.skip == skip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, timestamp.hashCode);
    hash = _SystemHash.combine(hash, skip.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchHomeFeedPostsRef = FutureProviderRef<List<Post>>;

/// See also [fetchHomeFeedPosts].
final fetchHomeFeedPostsProvider = FetchHomeFeedPostsFamily();

class FetchHomeFeedPostsFamily extends Family<AsyncValue<List<Post>>> {
  FetchHomeFeedPostsFamily();

  FetchHomeFeedPostsProvider call({
    DateTime? timestamp,
    int? skip,
  }) {
    return FetchHomeFeedPostsProvider(
      timestamp: timestamp,
      skip: skip,
    );
  }

  @override
  FutureProvider<List<Post>> getProviderOverride(
    covariant FetchHomeFeedPostsProvider provider,
  ) {
    return call(
      timestamp: provider.timestamp,
      skip: provider.skip,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchHomeFeedPostsProvider';
}

String $fetchTaggedPostsHash() => r'071ee324989a09a04ea7119023e4f6a244c4455f';

/// See also [fetchTaggedPosts].
class FetchTaggedPostsProvider extends FutureProvider<List<Post>> {
  FetchTaggedPostsProvider({
    required this.tag,
    this.timestamp,
    this.skip,
  }) : super(
          (ref) => fetchTaggedPosts(
            ref,
            tag: tag,
            timestamp: timestamp,
            skip: skip,
          ),
          from: fetchTaggedPostsProvider,
          name: r'fetchTaggedPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchTaggedPostsHash,
        );

  final String tag;
  final DateTime? timestamp;
  final int? skip;

  @override
  bool operator ==(Object other) {
    return other is FetchTaggedPostsProvider &&
        other.tag == tag &&
        other.timestamp == timestamp &&
        other.skip == skip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);
    hash = _SystemHash.combine(hash, timestamp.hashCode);
    hash = _SystemHash.combine(hash, skip.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchTaggedPostsRef = FutureProviderRef<List<Post>>;

/// See also [fetchTaggedPosts].
final fetchTaggedPostsProvider = FetchTaggedPostsFamily();

class FetchTaggedPostsFamily extends Family<AsyncValue<List<Post>>> {
  FetchTaggedPostsFamily();

  FetchTaggedPostsProvider call({
    required String tag,
    DateTime? timestamp,
    int? skip,
  }) {
    return FetchTaggedPostsProvider(
      tag: tag,
      timestamp: timestamp,
      skip: skip,
    );
  }

  @override
  FutureProvider<List<Post>> getProviderOverride(
    covariant FetchTaggedPostsProvider provider,
  ) {
    return call(
      tag: provider.tag,
      timestamp: provider.timestamp,
      skip: provider.skip,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchTaggedPostsProvider';
}
