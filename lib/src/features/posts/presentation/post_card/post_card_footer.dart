import 'package:auto_route/auto_route.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/embedded_webview.dart';
import '../../../../routes/app_router.gr.dart';

class PostCardFooter extends StatelessWidget {
  const PostCardFooter(
    this.post,
    this.postDisplayed, {
    super.key,
  });

  final Post post;
  final Post postDisplayed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(context.loc.comments(post.numComments) +
                (post.numSharedComments > 0
                    ? (' (+${post.numSharedComments})')
                    : "")),
            const Expanded(
              child: SizedBox(),
            ),
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                        child: EmbeddedWebview(
                            url: postDisplayed.singlePostPageUrl));
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {/* ... */},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                context.router.push(SinglePostRoute(
                  handle: post.postingProject.handle,
                  postId: post.postId,
                  post: post,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
