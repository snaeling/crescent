import 'package:crescent/src/features/authentication/application/auth_provider.dart';
import 'package:crescent/src/features/posts/presentation/post_card.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookmarksDialog extends ConsumerWidget {
  const BookmarksDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(authProvider).userState?.bookmarkedTags;
    return Dialog(
      child: SizedBox(
        height: .6 * MediaQuery.of(context).size.height,
        child: Column(
          children: [
            ListTile(
              title: Text(context.loc.bookmarks),
              trailing: IconButton(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.close),
                tooltip: context.loc.close,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bookmarks?.length ?? 0,
                itemBuilder: (context, index) =>
                    TagPill(tag: bookmarks![index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
