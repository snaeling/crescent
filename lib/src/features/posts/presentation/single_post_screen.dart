import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/common_widgets/egg_markdown.dart';
import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:crescent/src/common_widgets/post_blocks_builder.dart';
import 'package:crescent/src/features/posts/application/posts_service.dart';
import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    return Scaffold(
      body: future.when(
        data: (data) => CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          slivers: [
            const AppBar(),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 20)),
            SliverToBoxAdapter(
              child: ExpandedPostCardHeader(data.post),
            ),
            PostBody(post: data.post),
            SliverToBoxAdapter(
              child: PostCardFooter(data.post, data.post),
            ),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 20)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Text(
                  context.loc.comments_title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: data.comments.length,
                  (context, index) {
                    var c = data.comments;
                    if (c[c.keys.elementAt(index)]!.isNotEmpty) {
                      var handle = "";
                      if (data.post.postId.toString() ==
                          c.keys.elementAt(index)) {
                        handle = data.post.postingProject.handle;
                      } else {
                        for (var element in data.post.shareTree) {
                          if (c.keys.elementAt(index) ==
                              element.postId.toString()) {
                            handle = element.postingProject.handle;
                            break;
                          }
                        }
                      }
                      return ExpansionTile(
                        initiallyExpanded: true,
                        title: Text(context.loc.in_reply_to(handle)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommentTree(
                              commentList: c[c.keys.elementAt(index)]!,
                              depth: 0,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 150),
            ),
          ],
        ),
        error: (_, __) =>
            CustomScrollView(controller: scrollController, slivers: const [
          AppBar(),
          SliverToBoxAdapter(
            child: Text("Something went wrong..."),
          ),
        ]),
        loading: () => CustomScrollView(
          controller: scrollController,
          slivers: [
            const AppBar(),
            const SliverPadding(padding: EdgeInsetsDirectional.only(top: 20)),
            if (post != null) ...[
              SliverToBoxAdapter(
                child: ExpandedPostCardHeader(post!),
              ),
              PostBody(post: post!),
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
        ),
      ),
    );
  }
}

class CommentTree extends HookWidget {
  const CommentTree(
      {super.key, required this.commentList, required this.depth, this.parent});

  final List<Comment> commentList;
  final int depth;
  final Comment? parent;

  @override
  Widget build(BuildContext context) {
    List<Widget> comments = [];
    useEffect(() {
      comments = List.generate(commentList.length, (index) {
        var root = commentList[index];
        List<Widget> children =
            List.generate(root.comment.children!.length, (i) {
          return Column(
            children: [
              CommentWidget(
                comment: root.comment.children![i],
                depth: depth + 1,
              ),
              CommentTree(
                depth: depth + 2,
                commentList: root.comment.children![i].comment.children!,
                parent: root,
              ),
            ],
          );
        });
        if (depth == 0) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CommentWidget(
                    comment: root,
                    depth: depth,
                  ),
                  ...children
                ],
              ),
            ),
          );
        } else {
          return Column(
            children: [
              CommentWidget(
                comment: root,
                depth: depth,
              ),
              ...children
            ],
          );
        }
      });
      return null;
    });

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: comments,
      ),
    );
  }
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    required this.depth,
  });

  final Comment comment;
  final int depth;

  @override
  Widget build(BuildContext context) {
    final newLines = RegExp(r'<br\s*[\/]?>');
    final parsedComment = comment.comment.body.replaceAll(newLines, "\n");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: depth * 15,
          ),
          Avatar(
            comment.poster,
            size: depth == 0 ? 45 : 35,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    ExpandedPostCardProject(
                      comment.poster,
                      showImage: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: EggMarkdown(
                        data: parsedComment,
                        selectable: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'reply to @${comment.poster.handle}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(Icons.reply),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostBody extends StatelessWidget {
  const PostBody({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    // var childCount = 0;
    // Map<int, int> childMap = {};
    // for (var element in post.shareTree) {
    //   childCount += element.blocks!.length;
    //   if (element.headline != null || element != "") {
    //     childCount++;
    //   }
    // }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: post.shareTree.length + 1,
        (context, index) {
          if (index == post.shareTree.length) {
            return ExpandedPostSegment(post);
          }
          if (post.shareTree[index].blocks!.isNotEmpty ||
              post.shareTree[index].headline != "") {
            return Column(
              children: [
                ExpandedPostSegment(post.shareTree[index]),
                if (post.transparentShareOfPostId != null &&
                    post.shareTree[index].postId !=
                        post.transparentShareOfPostId)
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
              ],
            );
          }
          return Container();
        },
      ),
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

class ExpandedPostSegment extends StatelessWidget {
  const ExpandedPostSegment(this.post, {super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    if (post.blocks!.isEmpty && post.headline == "") return Container();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExpandedPostCardProject(post.postingProject),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PostBlocksBuilder(
                  post: post,
                  selectable: true,
                  markdownBody: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpandedPostCardProject extends StatelessWidget {
  const ExpandedPostCardProject(this.proj, {super.key, this.showImage = true});

  final Project proj;
  final bool showImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage) ...[
          Avatar(
            proj,
            size: 45,
          ),
          const SizedBox(width: 10),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(proj.displayName ?? proj.handle,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold, height: 1.15)),
              Text(
                '@${proj.handle} ${(proj.pronouns != null && proj.pronouns != "") ? "• ${proj.pronouns!}" : ""}',
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
