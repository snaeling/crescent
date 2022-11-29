import 'package:crescent/src/features/authentication/application/auth_provider.dart';
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
    state = state.copyWith(
        initiated: DateTime.now(),
        page: 0,
        isDone: false,
        isError: false,
        isLoading: true);
    await _getPosts(0);
  }

  nextPage() async {
    //if (state.isDone) return;
    final newPage = state.page + 1;
    state = state.copyWith(
        isLoading: true, page: newPage, isDone: false, isError: false);

    _getPosts(newPage);
  }

  previousPage() async {
    if (state.page <= 0) return;
    final newPage = state.page - 1;
    state = state.copyWith(isLoading: true, page: newPage, isError: false);

    _getPosts(newPage);
  }

  toPage(int page) async {
    //if (state.isDone && page > state.page) return;
    final newPage = page;
    state = state.copyWith(
        isLoading: true, page: newPage, isDone: false, isError: false);

    _getPosts(newPage);
  }

  _getPosts(int page) async {
    bool auth = ref.read(authProvider).loggedIn;
    state = state.copyWith(
        isLoading: true, page: page, isDone: false, isError: false, posts: []);

    List<Post>? posts;
    try {
      if (_config.handle != null) {
        posts = await ref
            .watch(postsServiceProvider)
            .fetchProfilePosts(_config.handle!, page);
        _successState(posts);
      } else if (_config.tag != null) {
        posts = await ref.watch(postsServiceProvider).fetchPostsByTag(
            _config.tag!, state.initiated, page * _postsPerPage);
        _successState(posts);
      } else {
        posts = !auth
            ? await ref.watch(postsServiceProvider).fetchPostsByTag(
                'The Cohost Global Feed', state.initiated, page * _postsPerPage)
            : await ref
                .watch(postsServiceProvider)
                .fetchHomeFeed(state.initiated!, page * _postsPerPage);
        _successState(posts);
      }
    } catch (e) {
      _errorState();
    }

    state = state.copyWith(isLoading: false, page: page);
  }

  _successState(List<Post> posts) {
    if (posts.isEmpty || posts.length < _postsPerPage) {
      state = state.copyWith(posts: posts, isDone: true, isLoading: false);
      return;
    } else {
      state = state.copyWith(posts: posts, isDone: false);
    }
  }

  _errorState() {
    state = state.copyWith(isError: true);
  }

  refresh() async {
    await _init();
    return;
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
