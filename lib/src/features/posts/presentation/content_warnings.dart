import 'package:cohost_api/cohost.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostContentWarning extends StatelessWidget {
  const PostContentWarning({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onSurface, width: 3.0),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
              TextSpan(
                text: context.loc.content_warnings_for,
              ),
              TextSpan(
                  text: post.cws.join(', '),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ])),
      ),
    );
  }
}

class PostAdultWarning extends StatelessWidget {
  const PostAdultWarning({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.onSurface, width: 3.0),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
              TextSpan(
                text: context.loc.hidden_adult_post,
              ),
            ])),
      ),
    );
  }
}
