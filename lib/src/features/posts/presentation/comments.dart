import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common_widgets/egg_markdown.dart';
import '../../../common_widgets/image_container.dart';
import 'expanded_post_card.dart';

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
                      timestamp: comment.comment.postedAtISO,
                      project: comment.poster,
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
