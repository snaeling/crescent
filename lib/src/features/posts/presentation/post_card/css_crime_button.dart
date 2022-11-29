import 'package:crescent/src/common_widgets/embedded_webview.dart';
import 'package:crescent/src/utils/localized_build_context.dart';
import 'package:flutter/material.dart';

class CssCrimeButton extends StatelessWidget {
  const CssCrimeButton({super.key, required this.url});

  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListTile(
      title: Text(context.loc.unsupported_styling),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.you_can_view_in_webview,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) =>
                      Dialog(child: EmbeddedWebview(url: url))),
              child: Text(context.loc.open_webview)),
        ],
      ),
      leading: const Icon(Icons.warning),
    ));
  }
}
