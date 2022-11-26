import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'image_container.dart';

class EggMarkdown extends StatelessWidget {
  const EggMarkdown({
    super.key,
    required this.data,
    this.align = WrapAlignment.start,
    this.selectable = false,
    this.markdownBody = false,
  });

  final String data;
  final WrapAlignment align;
  final bool selectable;
  final bool markdownBody;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: markdownBody
          ? MarkdownBody(
              shrinkWrap: true,
              selectable: selectable,
              data: data,
              imageBuilder: (uri, title, alt) => ImageContainer(uri.toString()),
              extensionSet: md.ExtensionSet.gitHubWeb,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                blockquoteDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                textAlign: align,
                h1Align: align,
                h2Align: align,
                h3Align: align,
                h4Align: align,
                h5Align: align,
                h6Align: align,
                unorderedListAlign: align,
                orderedListAlign: align,
                blockquoteAlign: align,
              ),
            )
          : Markdown(
              physics: const NeverScrollableScrollPhysics(),
              controller: PrimaryScrollController.of(context),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              selectable: selectable,
              data: data,
              imageBuilder: (uri, title, alt) => ImageContainer(uri.toString()),
              extensionSet: md.ExtensionSet.gitHubWeb,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                blockquoteDecoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                textAlign: align,
                h1Align: align,
                h2Align: align,
                h3Align: align,
                h4Align: align,
                h5Align: align,
                h6Align: align,
                unorderedListAlign: align,
                orderedListAlign: align,
                blockquoteAlign: align,
              ),
            ),
    );
  }
}
