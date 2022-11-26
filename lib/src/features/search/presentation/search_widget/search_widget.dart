import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String htmlData = r"""
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<div class="px-3  relative" data-post-body="true">
   <div class="prose my-4 break-words">
      <h1>
         <div style="display: inline-block; animation: 1.2s ease-in-out -2.23s infinite alternate-reverse none running spin; transform: translateY(-25%);">G</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -2.02s infinite alternate-reverse none running spin; transform: translateY(-25%);">r</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -1.82s infinite alternate-reverse none running spin; transform: translateY(-25%);">e</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -1.62s infinite alternate-reverse none running spin; transform: translateY(-25%);">e</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -1.42s infinite alternate-reverse none running spin; transform: translateY(-25%);">t</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -1.22s infinite alternate-reverse none running spin; transform: translateY(-25%);">i</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -1.01s infinite alternate-reverse none running spin; transform: translateY(-25%);">n</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -0.81s infinite alternate-reverse none running spin; transform: translateY(-25%);">g</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -0.61s infinite alternate-reverse none running spin; transform: translateY(-25%);">s</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -0.41s infinite alternate-reverse none running spin; transform: translateY(-25%);">,</div>
         <div style="display: inline-block; animation: 1.2s ease-in-out -0.21s infinite alternate-reverse none running spin; transform: translateY(-25%);">,</div>
      </h1>
      <p>Do you like putting <a href="https://www.youtube.com/watch?v=Vi7ULYt2ha0" target="_blank" rel="nofollow noopener noreferrer">links</a> in your posts? I've noticed a lot of posts with broken links, like <a href="google.com">this one</a>.</p>
      <p>If you omit the <span style="font-size: 1.4em; font-weight: bold;">https://</span> from your link <small>(the protocol)</small>, Cohost will interpret it as <code>https://cohost.org/YOURLINK.com</code>, which is probably not what you want.</p>
      <div style="width: 100%; border: 1px solid rgb(191, 186, 181); border-radius: 0.4em; overflow: hidden; display: flex; flex-direction: row; background-color: rgb(255, 249, 242); padding: 8px;">
         <div style="flex: 1 1 0%; display: flex; flex-direction: column; background-color: rgb(250, 177, 177); border-top-left-radius: 0.2em; border-bottom-left-radius: 0.2em;">
            <div style="color: red; align-self: center; font-weight: bold; font-size: 1.5em; margin-bottom: 8px;">🛑BAD🛑</div>
            <div style="font-family: monospace; font-size: 0.9em; margin-left: 12px; margin-bottom: 8px;"><a href="google.com" style="text-decoration: none;">[link](google.com)</a></div>
            <div style="font-family: monospace; font-size: 0.9em; margin-left: 12px; margin-bottom: 8px;"><a href="www.google.com" style="text-decoration: none;">[link](www.google.com)</a></div>
         </div>
         <div style="width: 8px;"></div>
         <div style="flex: 1 1 0%; display: flex; flex-direction: column; border-top-right-radius: 0.2em; border-bottom-right-radius: 0.2em; background-color: rgb(203, 250, 177);">
            <div style="color: green; align-self: center; font-weight: bold; font-size: 1.5em; margin-bottom: 8px;">✅GOOD✅</div>
            <div style="font-family: monospace; font-size: 0.9em; margin-left: 12px; margin-bottom: 8px;"><a href="https://google.com" style="text-decoration: none;" target="_blank" rel="nofollow noopener noreferrer">[link](https://google.com)</a></div>
            <div style="font-family: monospace; font-size: 0.9em; margin-left: 12px; margin-bottom: 8px;"><a href="https://www.google.com" style="text-decoration: none;" target="_blank" rel="nofollow noopener noreferrer">[link](https://www.google.com)</a></div>
         </div>
      </div>
      <p>Hope this helps! <img src="https://cohost.org/static/41454e429d62b5cb7963.png" alt=":eggbug:" title=":eggbug:" class="m-0 inline-block aspect-square object-contain align-middle" style="height: var(--emoji-scale);"> Happy chosting!</p>
   </div>
</div>

</html>
""";

class WebWidget extends StatelessWidget {
  WebWidget({super.key});
  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: Uri.dataFromString(htmlData,
                  mimeType: 'text/html', encoding: const Utf8Codec())
              .toString(),
        ),
      ),
    );
  }
}
