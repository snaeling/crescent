import 'package:auto_route/auto_route.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/utils/time_ago_extension.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/image_container.dart';
import '../../../../routes/app_router.gr.dart';

class PostCardProject extends StatelessWidget {
  const PostCardProject({
    super.key,
    required this.project,
    required this.post,
  });

  final Project project;
  final Post post;

  @override
  Widget build(BuildContext context) {
    final displayName =
        (project.displayName == null || project.displayName == "")
            ? '@${project.handle}'
            : project.displayName!;
    return Material(
      color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.router
              .push(ProjectRoute(handle: project.handle, project: project)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Avatar(project),
              const SizedBox(width: 10),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.publishedAt.timeAgo(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            displayName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold, height: 1.15),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '@${project.handle} ${(project.pronouns != null && project.pronouns != "") ? "• ${project.pronouns!}" : ""}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w300, height: 1.15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }
}
