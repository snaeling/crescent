import 'package:crescent/src/common_widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

class LinkPreview extends ConsumerWidget {
  const LinkPreview({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Metadata?> metadata = ref.watch(metadataProvider(url));

    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: metadata.when(
        data: (data) => PreviewTile(
          url: url,
          title: data?.title,
          description: data?.description,
          image: data?.image,
        ),
        error: (Object error, StackTrace stackTrace) => PreviewTile(url: url),
        loading: () => PreviewTile(
          url: url,
        ),
      ),
    );
  }
}

class PreviewTile extends StatelessWidget {
  const PreviewTile({
    super.key,
    required this.url,
    this.description,
    this.title,
    this.image,
  });

  final String url;
  final String? description;
  final String? title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 66,
            child: image == null
                ? const Icon(Icons.language)
                : EggImage(
                    url: image!,
                    cacheWidth: 66,
                  ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 75,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title == null
                    ? Text(uri.host,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold))
                    : Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                description == null
                    ? Text(uri.path,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall)
                    : Text(
                        description!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                Text(
                  url,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final metadataProvider =
    FutureProvider.autoDispose.family<Metadata?, String>((ref, url) async {
  ref.keepAlive();
  late final Metadata? metadata;
  try {
    metadata =
        await MetadataFetch.extract(url).timeout(const Duration(seconds: 3));
  } catch (e) {
    metadata = null;
  }
  return metadata;
});
