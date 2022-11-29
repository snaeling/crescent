import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/common_widgets/post_blocks_builder.dart';
import 'package:crescent/src/features/posts/presentation/post_card/css_crime_button.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:crescent/src/utils/time_ago_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/image_container.dart';
import '../../application/post_provider.dart';
import '../content_warnings.dart';

class ExpandedPostCard extends HookConsumerWidget {
  const ExpandedPostCard({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDisplayed =
        ref.watch(postProvider(post).select((post) => post.postDisplayed!));
    final isShare =
        ref.watch(postProvider(post).select((post) => post.isShare));
    final crime = ref.watch(postProvider(post).select((post) => post.crime));
    final showPostToggle =
        ref.watch(postProvider(post).select((post) => post.showPostToggle));
    final showPost =
        ref.watch(postProvider(post).select((post) => post.showPost));
    final postNotifier = ref.watch(postProvider(post).notifier);

    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: showPost
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: (post.blocks?.length ?? 0) + 2,
                (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ExpandedPostCardProject(
                        project: post.postingProject,
                        timestamp: post.publishedAt,
                      ),
                    );
                  }
                  if (index == 1) {
                    return post.headline != ""
                        ? Text(
                            post.headline,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        : Container();
                  }
                  if (crime) {
                    return CssCrimeButton(
                      url: postDisplayed.singlePostPageUrl,
                    );
                  }
                  if (showPost) {
                    var block = post.blocks![index - 2];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: PostBlockWidget(
                        block: block,
                        markdownBody: true,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          : (showPostToggle &&
                  (postDisplayed.effectiveAdultContent ||
                      postDisplayed.cws.isNotEmpty))
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      if (postDisplayed.effectiveAdultContent)
                        PostAdultWarning(post: postDisplayed),
                      if (postDisplayed.cws.isNotEmpty)
                        PostContentWarning(post: postDisplayed),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () {
                            postNotifier.toggleVisibility();
                          },
                          child: Text(showPost
                              ? context.loc.hide_post
                              : context.loc.show_post),
                        ),
                      ),
                    ],
                  ),
                )
              : const SliverToBoxAdapter(),
    );
  }
}

class ExpandedPostCardProject extends StatelessWidget {
  const ExpandedPostCardProject(
      {this.timestamp,
      required this.project,
      super.key,
      this.showImage = true});
  final DateTime? timestamp;
  final Project project;
  final bool showImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage) ...[
          Avatar(
            project,
            size: 45,
          ),
          const SizedBox(width: 10),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (timestamp != null)
                Text(
                  timestamp!.timeAgo(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold, height: 1.15),
                  overflow: TextOverflow.ellipsis,
                ),
              Text(
                  (project.displayName?.isEmpty ?? true)
                      ? '@${project.handle}'
                      : project.displayName!,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, height: 1.15)),
              Text(
                '@${project.handle} ${(project.pronouns?.isEmpty ?? true) ? "" : "• ${project.pronouns!}"}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w300, height: 1.15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpandedPostCardHeader extends StatelessWidget {
  const ExpandedPostCardHeader(
    this.post, {
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (post.transparentShareOfPostId != null) ...[
              Text('@${post.postingProject.handle}'),
              const Icon(Icons.repeat),
              Text('@${post.shareTree[0].postingProject.handle}'),
            ] else
              const SizedBox(
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}
