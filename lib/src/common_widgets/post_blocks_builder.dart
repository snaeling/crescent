import 'package:cached_network_image/cached_network_image.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/common_widgets/link_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:photo_view/photo_view.dart';

import 'egg_markdown.dart';
import 'image_container.dart';

class PostBlocksBuilder extends HookWidget {
  const PostBlocksBuilder({
    super.key,
    required this.post,
    this.truncate = 0,
    this.selectable = false,
    this.markdownBody = false,
  });
  final Post post;
  final int truncate;
  final bool selectable;
  final bool markdownBody;
  @override
  Widget build(BuildContext context) {
    List<Widget>? bls;

    useEffect(() {
      // when i was making this component i was going about this height based
      // in a way that fundamentally didnt work because i was silly, but
      // now i understand that i could've made it purely height based all
      // along, however, block based estimates are way more performant because
      // it's not a listview builder, so there's no lazy loading
      var generate = truncate > 0 ? truncate : post.blocks!.length;

      bls = List.generate(generate, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: PostBlockWidget(
            block: post.blocks![index],
            selectable: selectable,
          ),
        );
      });
      return null;
    });

    // return Column(
    //   children: [
    //     Text("A!"),
    //     Text("A!"),
    //   ],
    // );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.headline != "") ...[
            Text(post.headline,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
          ],
          Column(children: bls!),
        ],
      ),
    );
  }

  void afterBuild() {
    // executes after build is done
  }
}

class PostBlockWidget extends HookWidget {
  const PostBlockWidget(
      {required this.block,
      super.key,
      this.selectable = false,
      this.markdownBody = false});

  final PostBlock block;
  final bool selectable;
  final bool markdownBody;
  Html _calculate(String html) {
    return Html(
        style: {
          "body": Style(
            margin: Margins.zero,
            padding: EdgeInsets.zero,
          )
        },
        data: md.markdownToHtml(html),
        key: const ValueKey(1),
        onImageTap: (url, context, attributes, element) {
          if (url != null) {
            PhotoView(imageProvider: CachedNetworkImageProvider(url));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final keepAlive = useState(false);

    // Keep HTML and Image blocks alive so content just jump when scrolling back up!
    // Fortunately, due to manual pagination, I don't think this should
    // be much of a concern ...?
    // it does slow the theme switcher down profoundly though

    final computation = useState(Future<Html?>.value(null));
    final css = useState(false);
    useEffect(() {
      if (block.type == PostBlockType.markdown && !css.value) {
        final html = RegExp(r'<\/?[a-z][\s\S]*>', caseSensitive: false);
        final content = block.markdown!.content!;
        if (html.hasMatch(content) && content.length < 3000) {
          keepAlive.value = true;
          css.value = true;
          computation.value = compute(_calculate, content);
        } // todo css crime
      }

      return null;
    });
    useAutomaticKeepAlive(wantKeepAlive: keepAlive.value);

    switch (block.type) {
      case PostBlockType.markdown:
        final content = block.markdown?.content ?? "";
        if (css.value) {
          return FutureBuilder(
            future: computation.value,
            builder: (context, snapshot) {
              Widget child;
              if (snapshot.hasData) {
                child = snapshot.data as Html;
              } else {
                child = const Center(
                  child: CircularProgressIndicator(
                    key: ValueKey(0),
                  ),
                );
              }
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: child,
              );
            },
          );
        }
        try {
          if (!content.contains(RegExp(r'[\[\]\s*]')) &&
              Uri.parse(content).isAbsolute) {
            return LinkPreview(url: content);
          }
        } catch (e) {
          /*...*/
        }

        return EggMarkdown(
          data: content,
          selectable: selectable,
          markdownBody: markdownBody,
        );

      case PostBlockType.attachment:
        keepAlive.value = true;
        return ImageContainer(block.attachment!.previewURL ?? "");
      default:
        return Text(block.markdown?.content ?? "");
    }
  }
}
