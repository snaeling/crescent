import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/features/posts/application/posts_service.dart';
import 'package:crescent/src/features/posts/presentation/post_card/post_card_footer.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'comments.dart';
import 'expanded_post_card/expanded_post_card.dart';

class SinglePostScreen extends HookConsumerWidget {
  const SinglePostScreen(
      {super.key,
      @PathParam('handle') required this.handle,
      @PathParam('postId') required this.postId,
      this.post});

  final String handle;
  final int postId;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(fetchSinglePostProvider(handle, postId));
    final scrollController = useScrollController();
    final postList = useState(<Widget>[]);
    List<Widget> comments = [];

    List<Widget> generatePosts(Post post, [bool redundancy = false]) {
      if (redundancy && post == this.post) return postList.value;
      return List.generate(
        1 + post.shareTree.length,
        (index) {
          if (index == post.shareTree.length) {
            if (post.transparentShareOfPostId == null) {
              return ExpandedPostCard(post: post);
            }
          } else if (post.shareTree[index].blocks!.isNotEmpty ||
              post.shareTree[index].headline != "") {
            return ExpandedPostCard(post: post.shareTree[index]);
          }
          return SliverToBoxAdapter(child: Container());
        },
      );
    }

    List<Widget> generateComments(
        Map<String, List<Comment>> commentMap, Post posts) {
      Map<int, String> breakPoints = {};

      // Grab Comment Lists
      var commentsLists = [];
      for (var i = 0; i < commentMap.length; i++) {
        var postId = commentMap.keys.elementAt(i);
        breakPoints[i] = postId;
        commentsLists.add(commentMap[postId]);
      }
      List<Widget> widgets = [];

      // Insert Comment Trees
      for (var list in commentsLists) {
        widgets.add(
          CommentTree(commentList: list, depth: 0),
        );
      }

      // Insert "In Reply To" titles
      for (var i = 0; i < commentMap.length; i++) {
        var handle = "";
        var replyToId = commentMap.keys.elementAt(i);
        var len = commentMap[replyToId]!.length;
        if (len == 0) continue;

        if (replyToId == posts.postId.toString()) {
          handle = posts.postingProject.handle;
        } else {
          for (var e in posts.shareTree) {
            if (replyToId == e.postId.toString()) {
              handle = e.postingProject.handle;
            }
          }
        }
        widgets.insert(
          i + (i > 0 ? 1 : 0 * len),
          ExpansionTile(
            title: Text("In reply to @$handle"),
            trailing: const SizedBox(
              width: 1,
              height: 1,
            ),
          ),
        );
      }

      return widgets;
    }

    return Scaffold(
      body: future.when(
          data: (data) {
            if (post != data.post) postList.value = generatePosts(data.post);

            comments = generateComments(data.comments, data.post);
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              slivers: [
                const AppBar(),
                const SliverPadding(
                    padding: EdgeInsetsDirectional.only(top: 20)),
                SliverToBoxAdapter(
                  child: ExpandedPostCardHeader(data.post),
                ),
                ...postList.value,
                SliverToBoxAdapter(
                  child: PostCardFooter(data.post, data.post),
                ),
                const SliverPadding(
                    padding: EdgeInsetsDirectional.only(top: 20)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      context.loc.comments_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                // SliverList(
                //   delegate: SliverChildBuilderDelegate(
                //     childCount: data.comments[0]!.length,
                //     (context, index) {
                //       return CommentWidget(
                //           comment: data.comments[0]![index], depth: 0);
                //     },
                //   ),
                // ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: comments.length,
                    (context, index) => comments[index],
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 150),
                ),
              ],
            );
          },
          error: (_, __) =>
              CustomScrollView(controller: scrollController, slivers: const [
                AppBar(),
                SliverToBoxAdapter(
                  child: Text("Something went wrong..."),
                ),
              ]),
          loading: () {
            if (post != null) {
              postList.value = generatePosts(post!);
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  const AppBar(),
                  const SliverPadding(
                      padding: EdgeInsetsDirectional.only(top: 20)),
                  if (post != null) ...[
                    SliverToBoxAdapter(
                      child: ExpandedPostCardHeader(post!),
                    ),
                    ...postList.value,
                    SliverToBoxAdapter(
                      child: PostCardFooter(post!, post!),
                    )
                  ],
                  const SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      centerTitle: true,
      floating: true,
      expandedHeight: 0,
      title: Text('Viewing Post'),
    );
  }
}
