import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crescent/src/common_widgets/photo_viewer.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    // Played around with layoutbuilder, boxconstraints etc, but in the end
    // I think this basic behaivour is fine.

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: EggImage(url: url),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar(this.project, {super.key, this.size = 50.0});

  final Project project;
  final double size;

  @override
  Widget build(BuildContext context) {
    var url = project.avatarPreviewURL;
    if (url == "" || url == null) {
      url = 'https://cohost.org/static/f0c56e99113f1a0731b4.svg';
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.router
          .push(ProjectRoute(handle: project.handle, project: project)),
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(300.0),
          child: EggImage(
            url: url,
            cacheWidth: size.toInt(),
            expandable: false,
          ),
        ),
      ),
    );
  }
}

class EggImage extends StatelessWidget {
  const EggImage({
    super.key,
    required this.url,
    this.cacheWidth,
    this.expandable = true,
  });
  final String url;
  final int? cacheWidth;
  final bool expandable;
  @override
  Widget build(BuildContext context) {
    final body = CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      memCacheWidth: cacheWidth ?? MediaQuery.of(context).size.width ~/ 1.1,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      fadeInDuration: Duration.zero,
    );

    return !url.endsWith('.svg')
        ? expandable
            ? GestureDetector(
                onTap: () => showDialog(
                      context: context,
                      builder: (context) => PhotoViewer(url: url),
                    ),
                child: body)
            : body
        : SvgPicture.network(
            url,
            fit: BoxFit.cover,
          );
  }
}
