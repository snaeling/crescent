// a

import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/features/projects/presentation/project_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProjectScreen(
      project: project,
      handle: project.handle,
    );
  }
}
