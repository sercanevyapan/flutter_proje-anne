import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MaterialApp(
      // Home
      home: Anket()));
}

class Anket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: WebviewScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purpleAccent,
        ),
        url:
            "https://docs.google.com/forms/d/e/1FAIpQLScdaHSzAmp0KOfV0stwpRTTeZvBDmNUWvC0L2wrdmRVL9bekA/viewform?usp=sf_link",
      ),
    );
  }
}
