import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crescent/src/common_widgets/photo_viewer.dart';
import 'package:crescent/src/routes/app_router.gr.dart';
import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
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
  const Avatar(this.project,
      {super.key,
      this.size = 50.0,
      this.clickable = true,
      this.expandable = false});

  final Project project;
  final double size;
  final bool clickable;
  final bool expandable;

  @override
  Widget build(BuildContext context) {
    var url = project.avatarPreviewURL;
    if (url == "" || url == null) {
      url = 'https://cohost.org/static/f0c56e99113f1a0731b4.svg';
    }

    final avatar = SizedBox(
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
    );
    return clickable
        ? GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => clickable
                ? context.router.push(
                    ProjectRoute(handle: project.handle, project: project))
                : {},
            child: avatar)
        : avatar;
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
      fit: BoxFit.contain,
      memCacheWidth: cacheWidth ?? MediaQuery.of(context).size.width ~/ 1.1,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      fadeInDuration: Duration.zero,
    );
    final sanitizedUrl = url.split(RegExp(r'[?#]'))[0];
    try {
      if (sanitizedUrl.endsWith('.svg')) {
        return SvgPicture.network(
          url,
          fit: BoxFit.contain,
        );
      } else if (sanitizedUrl.endsWith('.avif')) {
        return AvifImage.network(
          url,
          fit: BoxFit.contain,
        );
      }
      return expandable
          ? GestureDetector(
              onTap: () => showDialog(
                    context: context,
                    builder: (context) => PhotoViewer(url: url),
                  ),
              child: body)
          : body;
    } catch (e) {
      return Image.asset('assets/images/icon/icon.png');
    }
  }
}
