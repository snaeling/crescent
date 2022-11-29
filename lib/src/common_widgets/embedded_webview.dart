import 'dart:async';
import 'dart:convert';

import 'package:cohost_api/cohost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import '../features/authentication/data/user_repository.dart';

class EmbeddedWebview extends HookConsumerWidget {
  const EmbeddedWebview({super.key, required this.url});

  final String url;

  // https://github.com/flutter/flutter/issues/57575#issuecomment-647692482
  String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            mimeType: mime)
        .toString();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 500,
            child: WebView(initialUrl: url),
          ),
        ],
      ),
    );
  }
}
