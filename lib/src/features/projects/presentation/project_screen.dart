import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crescent/src/common_widgets/egg_markdown.dart';
import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:crescent/src/features/posts/application/feed_provider.dart';
import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/utils/isar.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:ui' as ui;

import '../../posts/presentation/select_page_dialog.dart';

class ProjectScreen extends HookConsumerWidget {
  const ProjectScreen(
      {super.key, @PathParam('handle') required this.handle, this.project});

  final String handle;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proj = project ??
        ref
            .watch(isarCacheServiceProvider)
            .getProjectSync(handle)
            ?.toProject() ??
        Project(
          handle: handle,
          projectId: 0,
          flags: [],
          displayName: handle,
        );
    final scrollController = useScrollController();
    final feed = ref.watch(projectFeedProvider(handle).notifier);
    final feedState = ref.watch(projectFeedProvider(handle));

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => feed.refresh(),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: ProjectScreenHeader(
                    project: proj,
                    maxExtent: 150,
                    minExtent: 50,
                    controller: scrollController),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Bio(project: proj),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  final isLoading =
                      ref.watch(projectFeedProvider(handle)).isLoading;
                  final posts = ref.watch(projectFeedProvider(handle)).posts;

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
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 150))
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

class Bio extends StatelessWidget {
  const Bio({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Display name or handle, big, bold
        Text(
          project.displayName == ""
              ? '@${project.handle}'
              : project.displayName!,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        // Project Handle
        Text(
          '@${project.handle}',
          textAlign: TextAlign.center,
        ),

        // dek
        if (project.dek != null) ...[
          EggMarkdown(
            data: project.dek!.replaceAll('&nbsp;', ' '),
            align: WrapAlignment.center,
          )
        ],
        const SizedBox(
          height: 10,
        ),
        // pronouns and url
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (project.pronouns != null && project.pronouns != "") ...[
              const Icon(Icons.person),
              Text(
                project.pronouns!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
            if (project.url != null && project.url != "") ...[
              const Icon(Icons.link),
              Text(
                project.url!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Description
        if (project.description != null) ...[
          EggMarkdown(
              data: project.description!.replaceAll('&nbsp;', ' '),
              align: WrapAlignment.center)
        ],
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class ProjectScreenHeader implements SliverPersistentHeaderDelegate {
  ProjectScreenHeader({
    required this.minExtent,
    required this.maxExtent,
    required this.project,
    required this.controller,
  });

  @override
  final double minExtent;
  @override
  final double maxExtent;

  final Project project;

  final ScrollController controller;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const avatarSize = 75.0;
    final header =
        (project.headerPreviewURL == null || project.headerPreviewURL == "")
            ? null
            : project.headerPreviewURL;
    final displayName = project.displayName ?? project.handle;

    double scrollFactor({double factor = 1, bool inverse = false}) {
      if (inverse) {
        return factor * (0 + max(0.0, shrinkOffset) / maxExtent);
      }
      return factor * (1.0 - max(0.0, shrinkOffset) / maxExtent);
    }

    void scrollUp() {
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: scrollFactor(factor: 1),
          child: header != null
              ? CachedNetworkImage(
                  imageUrl: header,
                  fit: BoxFit.cover,
                )
              : SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
        ),
        ClipRRect(
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
                sigmaX: scrollFactor(factor: 5, inverse: true),
                sigmaY: scrollFactor(factor: 5, inverse: true)),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: MediaQuery.of(context).size.width / 2 - avatarSize / 2,
          child: Opacity(
            opacity: scrollFactor(factor: 1),
            child: SizedBox(
              child: Avatar(
                project,
                size: avatarSize,
              ),
            ),
          ),
        ),
        Positioned(
          top: 15,
          width: MediaQuery.of(context).size.width,
          child: SizedBox(
            height: 50.0,
            child: GestureDetector(
              onTap: scrollUp,
              child: Text(
                '@${project.handle}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => throw UnimplementedError();
}
