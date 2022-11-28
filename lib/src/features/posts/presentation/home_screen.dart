import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/features/authentication/data/user_repository.dart';
import 'package:crescent/src/features/posts/application/feed_provider.dart';
import 'package:crescent/src/features/posts/presentation/select_page_dialog.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:crescent/src/utils/secure_storage_service.dart';
import 'package:crescent/src/utils/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'post_card.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonController = useScrollController();
    final showButtons = useState(true);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        buttonController.addListener(() {
          final direction = buttonController.position.userScrollDirection;
          if (direction == ScrollDirection.reverse) {
            showButtons.value = false;
          } else if (direction == ScrollDirection.forward) {
            showButtons.value = true;
          }
        });
      });

      return null;
    }, [buttonController]);
    final feed = ref.watch(homeFeedProvider.notifier);
    final page = ref.watch(homeFeedProvider).page;
    final isLoading = ref.watch(homeFeedProvider).isLoading;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => feed.refresh(),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: buttonController,
          slivers: [
            SliverAppBar(
              centerTitle: true,
              floating: true,
              expandedHeight: 0,
              title: Text(context.loc.appName),
              leading: IconButton(
                  icon: const Icon(Icons.sunny),
                  tooltip: 'Change theme',
                  onPressed: () {
                    ref.read(darkModeProvider.notifier).toggle();
                  }),
            ),
            isLoading
                ? const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                    ),
                  )
                : const Feed(),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            feed.previousPage();
                          },
                          child: const Icon(Icons.arrow_back)),
                      SizedBox(
                          width: 50,
                          child: Text(
                            page.toString(),
                            textAlign: TextAlign.center,
                          )),
                      ElevatedButton(
                          onPressed: () {
                            feed.nextPage();
                          },
                          child: const Icon(Icons.arrow_forward)),
                      const Spacer(),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/eggbug.svg',
                    width: 75,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: showButtons.value
                    ? Row(
                        children: [
                          FilledButton.tonal(
                              onPressed: () {
                                feed.previousPage();
                              },
                              style: FilledButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: const Icon(Icons.arrow_back)),
                          FilledButton.tonal(
                            onPressed: () => showDialog(
                              context: context,
                              builder: (context) => SelectPageDialog(
                                  currentPage: page, onSelect: feed.toPage),
                            ),
                            style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            child: Text(page.toString()),
                          ),
                          FilledButton.tonal(
                            onPressed: () {
                              feed.nextPage();
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            child: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      )
                    : SizedBox(
                        key: UniqueKey(),
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ref.watch(secureStorageServiceProvider).retireCookie();
              },
              child: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}

class Feed extends ConsumerWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(homeFeedProvider).posts;
    return SliverPadding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          addSemanticIndexes: false,
          addAutomaticKeepAlives: false,
          childCount: posts.length,
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: PostCard(
                post: posts[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
