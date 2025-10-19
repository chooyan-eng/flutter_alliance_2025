import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BasicDemoPage extends StatelessWidget {
  const BasicDemoPage({super.key});

  static FlutterDeckSlideWidget get slide =>
      BasicDemoPage().withSlideConfiguration(
        FlutterDeckSlideConfiguration(route: '/basic-demo'),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(
              'https://dartpad.dev/?id=7864595840215a5876a1fbddcf58d18c',
            ),
          ),
          initialSettings: InAppWebViewSettings(pageZoom: 1.5),
        ),
      ),
    );
  }
}
