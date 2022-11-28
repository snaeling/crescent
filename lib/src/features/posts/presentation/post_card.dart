import 'package:auto_route/auto_route.dart';
import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:crescent/src/common_widgets/post_blocks_builder.dart';
import 'package:crescent/src/features/posts/application/post_provider.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/utils/time_ago_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import 'content_warnings.dart';

class PostCard extends HookConsumerWidget {
  const PostCard({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDisplayed =
        ref.watch(postProvider(post).select((post) => post.postDisplayed!));
    final strippedPost = postDisplayed.copyWith(shareTree: []);
    final isShare =
        ref.watch(postProvider(strippedPost).select((post) => post.isShare));
    final crime = ref.watch(postProvider(post).select((post) => post.crime));
    final truncateAt =
        ref.watch(postProvider(strippedPost).select((post) => post.truncateAt));
    final hiddenPosts = ref
        .watch(postProvider(strippedPost).select((post) => post.hiddenPosts));
    final showPostToggle = ref.watch(
        postProvider(strippedPost).select((post) => post.showPostToggle));
    final showPost =
        ref.watch(postProvider(strippedPost).select((post) => post.showPost));
    final postNotifier = ref.watch(postProvider(strippedPost).notifier);

    return GestureDetector(
      onTap: () => context.router.push(SinglePostRoute(
        handle: post.postingProject.handle,
        postId: post.postId,
        post: post,
      )),
      child: Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: <Widget>[
                    if (post.pinned)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('pinned'),
                            Icon(Icons.push_pin),
                          ],
                        ),
                      ),
                    if (isShare)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('@${post.postingProject.handle}'),
                          const Icon(Icons.repeat),
                          Text('@${post.shareTree[0].postingProject.handle}'),
                        ],
                      ),
                    if (hiddenPosts > 0)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withAlpha(0),
                                  Theme.of(context).colorScheme.onPrimary,
                                ],
                              ),
                            ),
                          ),
                          Text(
                            context.loc.posts_hidden(hiddenPosts),
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                    PostCardProject(
                        project: postDisplayed.postingProject,
                        post: postDisplayed),
                    const SizedBox(height: 15),
                    if (!showPost) ...[
                      if (postDisplayed.effectiveAdultContent)
                        PostAdultWarning(post: postDisplayed),
                      if (postDisplayed.cws.isNotEmpty)
                        PostContentWarning(post: postDisplayed),
                    ],
                    if (showPostToggle)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          onPressed: () {
                            postNotifier.toggleVisibility();
                          },
                          child: Text(showPost
                              ? context.loc.hide_post
                              : context.loc.show_post),
                        ),
                      ),
                    if (showPost)
                      crime
                          ? EmbeddedWebview(post: postDisplayed)
                          : Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: postDisplayed.blocks!.isNotEmpty
                                  ? PostBlocksBuilder(
                                      post: postDisplayed, truncate: truncateAt)
                                  : Text(
                                      postDisplayed.headline,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                            ),
                    const SizedBox(height: 15),
                  ],
                ),
                if (truncateAt > 0) ...[
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.onPrimary.withAlpha(0),
                        Theme.of(context).colorScheme.onPrimary,
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.push(SinglePostRoute(
                          handle: post.postingProject.handle,
                          postId: post.postId,
                          post: post,
                        ));
                      },
                      child: Text(
                        'View Full Post',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]
              ],
            ),
            PostCardFooter(post, postDisplayed),
            TagCarousel(tags: postDisplayed.tags)
          ],
        ),
      ),
    );
  }
}

String footer = """</div></body>
    </html>""";

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
                    return Dialog(child: EmbeddedWebview(post: postDisplayed));
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
            children: [
              Avatar(project),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.publishedAt.timeAgo(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold, height: 1.15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      displayName,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold, height: 1.15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '@${project.handle} ${(project.pronouns != null && project.pronouns != "") ? "• ${project.pronouns!}" : ""}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w300, height: 1.15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagCarousel extends HookWidget {
  const TagCarousel({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    late List<Widget> tagPills;
    useEffect(() {
      tagPills = List.generate(
          tags.length,
          (index) => TagPill(
                tag: tags[index],
              ));
      return null;
    });

    return tags.isNotEmpty
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //controller: PrimaryScrollController.of(context),
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    itemBuilder: (context, index) {
                      return index.isEven
                          ? TagPill(tag: tags[index])
                          : Container();
                    },
                  ),
                ),
                if (tags.length > 1)
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      //controller: PrimaryScrollController.of(context),
                      scrollDirection: Axis.horizontal,
                      itemCount: tags.length,
                      itemBuilder: (context, index) {
                        return index.isOdd
                            ? TagPill(tag: tags[index])
                            : Container();
                      },
                    ),
                  )
              ],
            ),
          )
        : Container();

    return tags.isNotEmpty
        ? SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tagPills.length,
              itemBuilder: (context, index) => TagPill(tag: tags[index]),
            ),
          )
        : Container();
  }
}

class TagPill extends StatelessWidget {
  const TagPill({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FilledButton.tonal(
          onPressed: () {
            context.router.push(TagRoute(tag: tag));
          },
          child: Text('#$tag')),
    );
  }
}

class EmbeddedWebview extends ConsumerWidget {
  const EmbeddedWebview({super.key, required this.post});

  final Post post;

  // https://github.com/flutter/flutter/issues/57575#issuecomment-647692482
  String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            mimeType: mime)
        .toString();
  }

  Future<String> addFontToHtml(
      String htmlContent, String fontAssetPath, String fontMime) async {
    final fontData = await rootBundle.load(fontAssetPath);
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontCss =
        '@font-face { font-family: customFont; src: url($fontUri); } * { font-family: customFont; }';
    return '<style>$fontCss</style>$htmlContent';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("WebView"),
          // SizedBox(
          //   height: 500,
          //   child: FutureBuilder(
          //     future: ref.watch(userRepositoryProvider).api.http.get(
          //         raw: true, path: "/", uri: Uri.parse(post.singlePostPageUrl)),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         var s = snapshot.data as http.Response;
          //         var p = parse(s.bodyBytes);
          //         // var body = p
          //         //     .querySelector('[data-testid="post-${post.postId}"]')!
          //         //     .innerHtml;
          //         var body = p.getElementsByTagName('article').first.outerHtml;
          //         var parent = p
          //             .getElementById('post-${post.postId}')!
          //             .parent!
          //             .querySelector('[data-post-body="true"]')!
          //             .outerHtml;

          //         return const Text("ph");
          //         // InAppWebView(
          //         //   initialUrlRequest:
          //         //       URLRequest(url: Uri.parse("https://inappwebview.dev/")),
          //         //   androidOnPermissionRequest:
          //         //       (controller, origin, resources) async {
          //         //     return PermissionRequestResponse(
          //         //         resources: resources,
          //         //         action: PermissionRequestResponseAction.GRANT);
          //         //   },
          //         // );

          //         // return WebView(
          //         //   backgroundColor: Theme.of(context).colorScheme.background,
          //         //   initialUrl: Uri.dataFromString(header + parent + footer,
          //         //           mimeType: 'text/html', encoding: const Utf8Codec())
          //         //       .toString(),
          //         // );
          //       } else {
          //         return const Center(
          //           child: SizedBox(
          //               width: 50,
          //               height: 50,
          //               child: CircularProgressIndicator(
          //                 strokeWidth: 1,
          //               )),
          //         );
          //       }
          //     },
          //   ),
          // ),
          const Text("Powered by the Web"),
        ],
      ),
    );
  }
}

String header = """<!DOCTYPE html>
    <html>
      <head>
      <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link data-chunk="client" rel="preload" as="style" href="https://cohost.org/static/client.f5337bd4309423137378.css">
<link data-rh="true" rel="apple-touch-icon" sizes="180x180" href="https://cohost.org/static/7ec6f0f3aef87d734f9b.png">
<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Atkinson+Hyperlegible">
<link data-rh="true" rel="icon" type="image/png" sizes="32x32"
    href="https://cohost.org/static/a4f72033a674e35d4cc9.png">
<link data-rh="true" rel="icon" type="image/png" sizes="16x16"
    href="https://cohost.org/static/3c154cde88b7ed1ca92a.png">
<link data-rh="true" rel="manifest" href="https://cohost.org/static/3cb3fec06b8a97a34e7b.webmanifest">
<link data-rh="true" rel="shortcut icon" href="https://cohost.org/static/1ba8b89b7a2ed8dd1d04.ico">
<link data-chunk="client" rel="stylesheet" href="https://cohost.org/static/client.f5337bd4309423137378.css">
<style data-rh="true">
    .prose {
	color: white;
	max-width: 65ch;
  font-famil: 'Atkinsons Hyperlegible';
}
    /*
 * colors specified as bare RGB components so they can get
 * merged with opacity if needed. see `tailwind.config.js`
 * for more info. */

    :root {
        --color-notWhite: 255 249 242;
        --color-notBlack: 25 25 25;
        --color-cherry: 131 37 79;
        --color-strawberry: 229 107 111;
        --color-mango: 255 171 92;
        --color-longan: 255 216 168;


        --color-text: var(--color-notWhite);
        --color-bg-text: var(--color-notBlack);

        --color-foreground-200: 238 173 199;
        --color-foreground-300: 211 116 155;
        --color-foreground-400: 174 68 115;
        --color-foreground-600: 103 26 61;
        --color-foreground-700: 81 17 46;
        --color-foreground-800: 59 9 32;
        --color-foreground: var(--color-cherry);

        --color-secondary-200: 244 187 187;
        --color-secondary-300: 238 153 155;
        --color-secondary-400: 229 107 111;
        --color-secondary-600: 164 42 47;
        --color-secondary-700: 123 27 31;
        --color-secondary: var(--color-strawberry);

        --color-accent: var(--color-mango);
        --color-background: var(--color-notWhite);
        --color-sidebar-bg: var(--color-notWhite);
        --color-sidebar-text: var(--color-notBlack);
        --color-sidebar-accent: var(--color-cherry);

        --color-compose-button: var(--color-foreground);
        --color-compose-button-400: var(--color-foreground-400);
        --color-compose-button-600: var(--color-foreground-600);
    }

    @media (max-width: 767px) {
        :root {
            --color-foreground: 103 26 61;
        }
    }

    @media (prefers-color-scheme: dark) {
        :root {
            --color-text: var(--color-notWhite);
            --color-bg-text: var(--color-notWhite);

            --color-foreground-200: 238 173 199;
            --color-foreground-300: 211 116 155;
            --color-foreground-400: 174 68 115;
            --color-foreground-600: 103 26 61;
            --color-foreground-700: 81 17 46;
            --color-foreground-800: 59 9 32;
            --color-foreground: var(--color-cherry);

            --color-secondary-200: 255 208 172;
            --color-secondary-300: 255 191 131;
            --color-secondary-400: 255 171 92;
            --color-secondary-600: 188 109 40;
            --color-secondary-700: 147 74 21;
            --color-secondary: var(--color-mango);

            --color-accent: var(--color-mango);
            --color-background: var(--color-notBlack);
            --color-sidebar-bg: var(--color-notBlack);
            --color-sidebar-text: var(--color-notWhite);
            --color-sidebar-accent: var(--color-mango);

            --color-compose-button: var(--color-foreground);
            --color-compose-button-400: var(--color-foreground-400);
            --color-compose-button-600: var(--color-foreground-600);
        }

        @media (max-width: 767px) {
            :root {
                --color-foreground: 103 26 61;
            }
        }
    }
</style>
<title>cohost! - post from @vogon</title>
<meta data-rh="true" name="apple-mobile-web-app-title" content="cohost">
<meta data-rh="true" name="application-name" content="cohost">
<meta data-rh="true" name="theme-color" content="#671A3D" media="(max-width: 1023px)">
<meta data-rh="true" name="theme-color" content="#83254f">
<script async="" src="https://cdn.iframe.ly/embed.js" type="text/javascript"></script>
<meta name="robots" content="noai, noimageai">
<style id="iframely-styles" type="text/css">
    .iframely-responsive {
        top: 0;
        left: 0;
        width: 100%;
        height: 0;
        position: relative;
        padding-bottom: 56.25%;
        box-sizing: border-box;
    }

    .iframely-responsive>* {
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        position: absolute;
        border: 0;
        box-sizing: border-box;
    }
</style>
<style data-rh="true">
    :root {
        --emoji-scale: 1.4em;
    }
</style>


</head><body style="font-family: 'Atkinson Hyperlegible',color:white !important"><div>""";
