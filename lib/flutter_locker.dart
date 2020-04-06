import 'dart:async';

import 'package:flutter/services.dart';

class FlutterLocker {
  static const MethodChannel _channel = const MethodChannel('flutter_locker');

  static Future<bool> canAuthenticate() async {
    final bool success = await _channel.invokeMethod('canAuthenticate');
    return success;
  }

  static Future<bool> save(String key, String secret, String androidPromptTitle, String androidPromptCancel) async {
    final bool success = await _channel.invokeMethod('saveSecret', [key, secret, androidPromptTitle, androidPromptCancel]);
    return success;
  }

  static Future<String> retrieve(String key, String promptTitle, String androidPromptCancel) async {
    final String secret = await _channel.invokeMethod('retrieveSecret', [key, promptTitle, androidPromptCancel]);
    return secret;
  }
}
