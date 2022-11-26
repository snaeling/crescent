import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crescent/src/app.dart';

void main() async {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}
