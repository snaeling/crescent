import 'package:flutter/material.dart';

enum Weight { thin, thick }

class TextIcon extends StatelessWidget {
  const TextIcon({super.key, required this.icon, required this.weight});

  final IconData icon;
  final Weight weight;
  @override
  Widget build(BuildContext context) {
    return Text(
      String.fromCharCode(icon.codePoint),
      style: TextStyle(
        inherit: false,
        fontWeight: FontWeight.w700,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
    );
  }
}
