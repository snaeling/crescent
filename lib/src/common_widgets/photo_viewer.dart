import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends HookConsumerWidget {
  const PhotoViewer({super.key, required this.url});

  final url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        PhotoView(
          backgroundDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          imageProvider: CachedNetworkImageProvider(url),
        ),
        ClipRect(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50.0,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
