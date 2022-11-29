import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/common_widgets/post_blocks_builder.dart';
import 'package:crescent/src/features/posts/application/post_provider.dart';
import 'package:crescent/src/features/posts/presentation/post_card/css_crime_button.dart';
import 'package:crescent/src/features/posts/presentation/post_card/post_card_footer.dart';
import 'package:crescent/src/features/posts/presentation/post_card/post_card_project.dart';
import 'package:crescent/src/features/posts/presentation/post_card/tags.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/embedded_webview.dart';
import '../content_warnings.dart';

class PostCard extends HookConsumerWidget {
  const PostCard({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDisplayed =
        ref.watch(postProvider(post).select((post) => post.postDisplayed!));
    final strippedPost = postDisplayed.copyWith(shareTree: []);
    final isShare =
        ref.watch(postProvider(post).select((post) => post.isShare));
    final crime = ref.watch(postProvider(post).select((post) => post.crime));
    final truncateAt =
        ref.watch(postProvider(strippedPost).select((post) => post.truncateAt));
    final hiddenPosts =
        ref.watch(postProvider(post).select((post) => post.hiddenPosts));
    final showPostToggle = ref.watch(
        postProvider(strippedPost).select((post) => post.showPostToggle));
    final showPost =
        ref.watch(postProvider(strippedPost).select((post) => post.showPost));
    final postNotifier = ref.watch(postProvider(strippedPost).notifier);

    return GestureDetector(
      onTap: () => context.router.push(SinglePostRoute(
        handle: post.postingProject.handle,
        postId: post.postId,
        post: post,
      )),
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: <Widget>[
                    if (post.pinned)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('pinned'),
                            Icon(Icons.push_pin),
                          ],
                        ),
                      ),
                    if (isShare)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('@${post.postingProject.handle}'),
                          const Icon(Icons.repeat),
                          Text('@${post.shareTree[0].postingProject.handle}'),
                        ],
                      ),
                    if (hiddenPosts > 0)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withAlpha(0),
                                  Theme.of(context).colorScheme.onPrimary,
                                ],
                              ),
                            ),
                          ),
                          Text(
                            context.loc.posts_hidden(hiddenPosts),
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                    PostCardProject(
                        project: postDisplayed.postingProject,
                        post: postDisplayed),
                    const SizedBox(height: 15),
                    if (!showPost) ...[
                      if (postDisplayed.effectiveAdultContent)
                        PostAdultWarning(post: postDisplayed),
                      if (postDisplayed.cws.isNotEmpty)
                        PostContentWarning(post: postDisplayed),
                    ],
                    if (showPostToggle)
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
                    if (showPost)
                      crime
                          ? CssCrimeButton(url: postDisplayed.singlePostPageUrl)
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: postDisplayed.blocks!.isNotEmpty
                                  ? PostBlocksBuilder(
                                      post: postDisplayed, truncate: truncateAt)
                                  : Text(
                                      postDisplayed.headline,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                            ),
                    const SizedBox(height: 15),
                  ],
                ),
                if (truncateAt > 0) ...[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.onPrimary.withAlpha(0),
                        Theme.of(context).colorScheme.onPrimary,
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(SinglePostRoute(
                          handle: post.postingProject.handle,
                          postId: post.postId,
                          post: post,
                        ));
                      },
                      child: Text(
                        'View Full Post',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]
              ],
            ),
            PostCardFooter(post, postDisplayed),
            TagCarousel(tags: postDisplayed.tags)
          ],
        ),
      ),
    );
  }
}
