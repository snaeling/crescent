import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/features/search/application/search_provider.dart';
import 'package:crescent/src/features/search/presentation/project_card.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchScreen extends HookConsumerWidget {
  SearchScreen({super.key});
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    },
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: context.loc.search,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) => searchNotifier.search(value),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.tags.length,
                  (context, index) => TagPill(tag: state.tags[index].tag),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.projects.length,
                  (context, index) =>
                      ProjectCard(project: state.projects[index]),
                ),
              ),
            ],
          )),
    );
  }
}
