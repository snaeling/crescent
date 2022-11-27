import 'dart:async';

import 'package:crescent/src/utils/isar.dart';
import 'package:cohost_api/cohost.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/user_repository.dart';

part 'posts_service.g.dart';

class PostsService {
  PostsService(this._ref);
  final Ref _ref;

  StreamController<Post> controller = StreamController<Post>.broadcast();

  Future<List<Post>> fetchHomeFeed([DateTime? timestamp, int? skip]) async {
    final api = _ref.read(userRepositoryProvider).api;
    final res = await api.posts.htmlDashboard(timestamp, skip);
    _ref.watch(isarCacheServiceProvider).savePosts(res);

    return res;
  }

  Future<List<Post>> fetchPostsByTag(String tag,
      [DateTime? timestamp, int? page]) async {
    final api = _ref.read(userRepositoryProvider).api;
    final res = await api.posts.htmlTagged(tag, timestamp, page);
    _ref.watch(isarCacheServiceProvider).savePosts(res);

    return res;
  }

  Future<List<Post>> fetchProfilePosts(String handle, int page) async {
    final api = _ref.read(userRepositoryProvider).api;
    final res = await api.posts.getProfilePosts(page, handle);
    _ref.watch(isarCacheServiceProvider).savePosts(res);
    return res;
  }

  Future<SinglePost> fetchPost(String handle, int postId) async {
    final api = _ref.read(userRepositoryProvider).api;
    final res = await api.posts.getSinglePost(handle, postId);
    _ref.watch(isarCacheServiceProvider).savePost(res.post);
    return res;
  }
}

@Riverpod(keepAlive: true)
PostsService postsService(PostsServiceRef ref) {
  return PostsService(ref);
}

@riverpod
Future<SinglePost> fetchSinglePost(
    FetchSinglePostRef ref, String handle, int id) async {
  PostsService service = ref.watch(postsServiceProvider);
  return service.fetchPost(handle, id);
}

@Riverpod(keepAlive: true)
Future<List<Post>> fetchProfilePosts(FetchProfilePostsRef ref,
    {required String handle, required int page}) async {
  PostsService service = ref.watch(postsServiceProvider);
  final posts = await service.fetchProfilePosts(handle, page);
  return posts;
}

@Riverpod(keepAlive: true)
Future<List<Post>> fetchHomeFeedPosts(FetchHomeFeedPostsRef ref,
    {DateTime? timestamp, int? skip}) async {
  PostsService service = ref.watch(postsServiceProvider);
  final posts = await service.fetchHomeFeed(timestamp, skip);
  return posts;
}

@Riverpod(keepAlive: true)
Future<List<Post>> fetchTaggedPosts(FetchTaggedPostsRef ref,
    {required String tag, DateTime? timestamp, int? skip}) async {
  PostsService service = ref.watch(postsServiceProvider);
  final posts = await service.fetchPostsByTag(tag, timestamp, skip);
  return posts;
}
