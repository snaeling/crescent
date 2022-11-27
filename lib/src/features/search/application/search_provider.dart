import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/features/search/application/search_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_provider.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    String? query,
    @Default([]) List<Project> projects,
    @Default([]) List<Tag> tags,
    @Default(true) bool isLoading,
    @Default(false) bool isError,
    DateTime? lastUpdate,

    /// Is true if the feed has exhausted itself.
    @Default(false) bool isDone,
  }) = _SearchState;

  const SearchState._();
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier(this.ref) : super(const SearchState());
  final Ref ref;

  search(String query) async {
    state = state.copyWith(query: query);
    if (query.isEmpty) {
      clear();
      return;
    }
    if (query.length < 3) return;
    state = state.copyWith(lastUpdate: DateTime.now(), isLoading: true);

    try {
      final res = await ref.read(queryProvider(query).future);
      state = state.copyWith(
          isLoading: false, projects: res.projects, tags: res.tags);
    } catch (e) {
      state = state.copyWith(isLoading: false, isError: true);
    }
  }

  clear() {
    state = state.copyWith(
      lastUpdate: DateTime.now(),
      isLoading: false,
      query: null,
      isDone: false,
      projects: [],
      tags: [],
    );
  }
}

final searchProvider =
    StateNotifierProvider.autoDispose<SearchNotifier, SearchState>((ref) {
  return SearchNotifier(ref);
});
