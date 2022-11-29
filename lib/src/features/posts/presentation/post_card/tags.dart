import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../routes/app_router.gr.dart';

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
