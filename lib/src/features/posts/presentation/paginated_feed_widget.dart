import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaginatedFeed extends HookWidget {
  const PaginatedFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        return true;
      },
      child: const Text("a"),
    );
  }
}
