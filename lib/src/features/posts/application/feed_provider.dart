import 'package:crescent/src/features/posts/application/posts_service.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_provider.freezed.dart';

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    int? id,
    @Default(0) int page,
    @Default([]) List<Post> posts,
    @Default(true) bool isLoading,
    @Default(false) bool isError,
    DateTime? initiated,

    /// Is true if the feed has exhausted itself.
    @Default(false) bool isDone,
  }) = _FeedState;

  const FeedState._();
}

class FeedConfig {
  final String? tag;
  final String? handle;
  final bool? home;

  FeedConfig({this.tag, this.handle, this.home});
}

class FeedNotifier extends StateNotifier<FeedState> {
  FeedNotifier(this.ref, FeedConfig config)
      : _config = config,
        super(const FeedState()) {
    _init();
  }

  final Ref ref;
  final FeedConfig _config;
  final int _postsPerPage = 20;

  _init() async {
    state = state.copyWith(initiated: DateTime.now(), page: 0);
    late final List<Post> posts;
    if (_config.handle != null) {
      posts = await ref
          .watch(postsServiceProvider)
          .fetchProfilePosts(_config.handle!, state.page);
    } else if (_config.tag != null) {
      posts =
          await ref.watch(postsServiceProvider).fetchPostsByTag(_config.tag!);
    } else {
      posts = await ref.watch(postsServiceProvider).fetchHomeFeedTest();
    }

    if (posts.isEmpty || posts.length < _postsPerPage) {
      state = state.copyWith(posts: posts, isDone: true, isLoading: false);
      return;
    }

    state = state.copyWith(posts: posts, isLoading: false);
  }

  nextPage() async {
    if (state.isDone) return;
    final newPage = state.page + 1;
    state = state.copyWith(isLoading: true, page: newPage);

    late final List<Post> posts;
    // TODO: this should be move into a separate function
    if (_config.handle != null) {
      posts = await ref
          .watch(postsServiceProvider)
          .fetchProfilePosts(_config.handle!, newPage);
    } else if (_config.tag != null) {
      posts = await ref.watch(postsServiceProvider).fetchPostsByTag(
          _config.tag!, state.initiated!, newPage * _postsPerPage);
    } else {
      posts = await ref
          .watch(postsServiceProvider)
          .fetchHomeFeedTest(state.initiated!, newPage * _postsPerPage);
    }

    if (posts.isEmpty || posts.length < _postsPerPage) {
      state = state.copyWith(posts: posts, isDone: true, isLoading: false);
      return;
    }

    state = state.copyWith(posts: posts, isLoading: false, page: newPage);
  }

  previousPage() async {
    if (state.page <= 0) return;
    final newPage = state.page - 1;
    state = state.copyWith(isLoading: true, page: newPage);

    late final List<Post> posts;
    if (_config.handle != null) {
      posts = await ref
          .watch(postsServiceProvider)
          .fetchProfilePosts(_config.handle!, newPage);
    } else if (_config.tag != null) {
      posts = await ref.watch(postsServiceProvider).fetchPostsByTag(
          _config.tag!, state.initiated!, newPage * _postsPerPage);
    } else {
      posts = await ref
          .watch(postsServiceProvider)
          .fetchHomeFeedTest(state.initiated!, newPage * _postsPerPage);
    }

    state = state.copyWith(posts: posts, isLoading: false, page: newPage);
  }

  toPage(int page) async {}

  refresh() async {
    await _init();
    return;
    const newPage = 0;
    state = state.copyWith(isLoading: true, posts: [], page: newPage);

    final posts = await ref.watch(postsServiceProvider).fetchHomeFeedTest();

    if (posts.isEmpty || posts.length < _postsPerPage) {
      state = state.copyWith(posts: posts, isDone: true, isLoading: false);
      return;
    }

    state = state.copyWith(posts: posts, isLoading: false, page: newPage);
  }
}

final homeFeedProvider =
    StateNotifierProvider.autoDispose<FeedNotifier, FeedState>((ref) {
  ref.keepAlive();
  return FeedNotifier(ref, FeedConfig(home: true));
});

final projectFeedProvider = StateNotifierProvider.autoDispose
    .family<FeedNotifier, FeedState, String>((ref, handle) {
  ref.keepAlive();
  return FeedNotifier(ref, FeedConfig(handle: handle));
});

final tagFeedProvider = StateNotifierProvider.autoDispose
    .family<FeedNotifier, FeedState, String>((ref, tag) {
  ref.keepAlive();
  return FeedNotifier(ref, FeedConfig(tag: tag));
});

// @riverpod
// FeedNotifier feedNotifier(FeedNotifierRef ref, {required FeedConfig config}) {
//   return FeedNotifier(ref, config);
// }
