import 'dart:async';

import 'package:crescent/src/utils/isar.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/user_repository.dart';

part 'search_service.g.dart';

class SearchService {
  SearchService(this._ref);
  final Ref _ref;

  StreamController<Post> controller = StreamController<Post>.broadcast();

  Future<SearchResult> queryTerm(String searchTerm) async {
    try {
      final api = _ref.read(userRepositoryProvider).api;
      final res = await api.search.query(searchTerm);
      _ref.watch(isarCacheServiceProvider).saveProjects(res.projects);

      return res;
    } on UnauthorizedException {
      _ref.watch(secureStorageServiceProvider).retireCookie();
      throw UnauthorizedException("Invalid cookie");
    }
  }
}

@Riverpod(keepAlive: true)
SearchService searchService(SearchServiceRef ref) {
  return SearchService(ref);
}

@riverpod
Future<SearchResult> query(QueryRef ref, String term) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 60), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  SearchService service = ref.watch(searchServiceProvider);
  return service.queryTerm(term);
}
