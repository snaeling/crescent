import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/features/search/application/search_provider.dart';
import 'package:crescent/src/features/search/presentation/bookmarks_dialog.dart';
import 'package:crescent/src/features/search/presentation/project_card.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  SearchScreen({super.key});
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = useState("");
    final state = ref.watch(searchProvider);
    final searchNotifier = ref.watch(searchProvider.notifier);
    final searchController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    searchController.clear();
                    searchNotifier.clear();
                    query.value = "";
                  },
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(10),
                hintText: context.loc.search,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
            onChanged: (value) {
              searchNotifier.search(value);
              query.value = value;
            },
          ),
          actions: [
            IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const BookmarksDialog()),
              icon: const Icon(Icons.bookmark),
              tooltip: context.loc.bookmarks,
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            if (query.value.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverToBoxAdapter(
                    child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: () =>
                            context.router.push(TagRoute(tag: query.value)),
                        child: Text("#${query.value}",
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: FilledButton.tonal(
                        onPressed: () => context.router
                            .push(ProjectRoute(handle: query.value)),
                        child: Text(
                          "@${query.value}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.tags.length,
                (context, index) => TagPill(tag: state.tags[index].tag),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.projects.length,
                (context, index) => ProjectCard(project: state.projects[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
