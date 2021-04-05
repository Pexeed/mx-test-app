import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MxConnectionViewModel {
  FlutterWebviewPlugin _flutterWebviewPlugin;
  BuildContext _context;
  Uri uri;

  StreamSubscription<WebViewStateChanged> _onStateChanged;

  MxConnectionViewModel(
      this._flutterWebviewPlugin,
      this._context);

  Future<void> setup() async {
    await setupListeners();
  }

  Future<void> setupListeners() async {
    debugPrint("setting up listeners");

    _onStateChanged = _flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) async {
      Uri _parsedUri = Uri.parse(state.url);
      debugPrint("${_parsedUri.scheme} ${_parsedUri.host}");
      if (_parsedUri.isScheme('mx') || _parsedUri.isScheme('yourappscheme')) {
        debugPrint("${_parsedUri.scheme} ${_parsedUri.host}");
        _flutterWebviewPlugin.stopLoading();
        debugPrint('Action detected: ' + _parsedUri.host);
      }
    });
  }

  Future<void> cleanup() async {
    if (_onStateChanged != null) {
      await _onStateChanged.cancel();
    }
    _flutterWebviewPlugin.dispose();
  }
}
