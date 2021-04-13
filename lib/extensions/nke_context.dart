import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ContextExtension on BuildContext {
  static DateTime? currentBackPressTime;
  unfocusKeyboard() {
    FocusScope.of(this).unfocus();
  }

  toggleFullscreen({bool fullscreen = true}) {
    if (fullscreen)
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  push({required Widget page}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  pushNamed(String route, {Object? args}) {
    if (route.isEmpty) return;

    Navigator.pushNamed(this, route, arguments: args);
  }

  pushReplacement({required Widget page}) {
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => page));
  }

  pushReplacementNamed(String route, {Object? args}) {
    if (route.isEmpty) return;
    Navigator.pushReplacementNamed(this, route, arguments: args);
  }

  pop({bool? result}) {
    if (result != null) {
      Navigator.pop(this, result);
      return;
    }
    Navigator.pop(this);
  }
}
