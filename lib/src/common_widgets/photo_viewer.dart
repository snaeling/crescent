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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PhotoView(
              backgroundDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
              ),
              imageProvider: CachedNetworkImageProvider(url),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.of(context).maybePop(),
                          icon: const Icon(Icons.arrow_back))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
