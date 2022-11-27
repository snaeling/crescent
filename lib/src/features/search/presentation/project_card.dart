import 'package:auto_route/auto_route.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final displayName =
        (project.displayName == null || project.displayName == "")
            ? '@${project.handle}'
            : project.displayName!;
    return Card(
      child: InkWell(
        onTap: () => context.router
            .push(ProjectRoute(handle: project.handle, project: project)),
        child: ListTile(
          leading: Avatar(project),
          title: Text(displayName),
          subtitle: Text('@${project.handle}'),
        ),
      ),
    );
  }
}
