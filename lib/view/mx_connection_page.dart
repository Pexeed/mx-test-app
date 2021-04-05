import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mx_test_app/view/mx_connection_vm.dart';

class MxConnectionPage extends StatefulWidget {
  final String url;

  MxConnectionPage(this.url);

  @override
  MxConnectionPageState createState() => MxConnectionPageState();
}

class MxConnectionPageState extends State<MxConnectionPage> {
  final _flutterWebviewPlugin = FlutterWebviewPlugin();
  MxConnectionViewModel _viewModel;

  @override
  void initState() {
    _viewModel = MxConnectionViewModel(
      _flutterWebviewPlugin,
      context,
    );
    _viewModel.setup();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.cleanup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          color: Colors.white,
          child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            withJavascript: true,
            clearCache: true,
            scrollBar: false,
            resizeToAvoidBottomInset: true,
            appCacheEnabled: false,
          )),
    ));
  }
}
