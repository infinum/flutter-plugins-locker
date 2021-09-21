
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterLocker {
  static const MethodChannel _channel = MethodChannel('flutter_locker');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
