import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/posts/application/feed_provider.dart';
import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/features/posts/presentation/select_page_dialog.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TagScreen extends HookConsumerWidget {
  const TagScreen({super.key, @PathParam('tag') required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final feed = ref.watch(tagFeedProvider(tag).notifier);
    final feedState = ref.watch(tagFeedProvider(tag));

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => feed.refresh(),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                title: Text('#$tag'),
                floating: true,
              ),
              Builder(
                builder: (context) {
                  final isLoading = ref.watch(tagFeedProvider(tag)).isLoading;
                  final posts = ref.watch(tagFeedProvider(tag)).posts;

                  if (isLoading) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                        )),
                      ),
                    );
                  } else {
                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: posts.length,
                          (context, index) => PostCard(post: posts[index]),
                        ),
                      ),
                    );
                  }
                },
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 150),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton.tonal(
            onPressed: () {
              feed.previousPage();
            },
            child: const Icon(Icons.arrow_back),
          ),
          FilledButton.tonal(
              onPressed: () => showDialog(
                    context: context,
                    builder: (context) => SelectPageDialog(
                        currentPage: feedState.page, onSelect: feed.toPage),
                  ),
              child: Text(feedState.page.toString())),
          FilledButton.tonal(
            onPressed: () {
              feed.nextPage();
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
