
import 'dart:async';

import 'package:flutter/services.dart';

class Nikutils {
  static const MethodChannel _channel =
      const MethodChannel('nikutils');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
