import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewEvent extends StatefulWidget {
  WebViewEvent({Key key}) : super(key: key);

  @override
  _WebViewEventState createState() => _WebViewEventState();
}

class _WebViewEventState extends State<WebViewEvent> {
  final _flutterwebview = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://www.kppmgkjwsambirejo.online/',
      // appBar: AppBar(
      //   title: Text("kppmgkjwsambirejo.online"),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      withZoom: true,
      withLocalStorage: true,
      withJavascript: true,
      initialChild: Center(
        child: Text("Loading....."),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _flutterwebview.dispose();
    super.dispose();
  }
}
