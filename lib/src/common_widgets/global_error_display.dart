// based on
// https://github.com/0x07dc/global_snack_bar/blob/ae0d5d00dacee276ee08d33b99211fc893788bf9/lib/global_snack_bar.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GlobalErrorWrapper extends HookWidget {
  final Widget content;

  const GlobalErrorWrapper(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    final active = useState(false);
    void showSnackBar(GlobalError error) {
      SnackBar bar = SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              error.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(error.body, style: Theme.of(context).textTheme.titleMedium!),
          ],
        ),
        backgroundColor: error.background,
      );

      ScaffoldMessenger.of(context).showSnackBar(bar);
    }

    useEffect(
      () {
        if (!active.value) {
          active.value = true;
          Future.microtask(() async {
            await for (var message in GlobalErrorService.newMessage) {
              showSnackBar(message);
            }
          });
        }

        return null;
      },
    );

    return content;
  }
}

class GlobalError {
  GlobalError({this.title = "", this.body = "", this.background = Colors.red});

  final String title;
  final String body;
  final Color background;
}

class GlobalErrorService {
  static final streamController = StreamController.broadcast();

  static Stream get newMessage => streamController.stream;

  void showMessage(GlobalError data) {
    streamController.sink.add(data);
  }

  dispose() {
    streamController.close();
  }
}
