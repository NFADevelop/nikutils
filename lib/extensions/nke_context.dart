import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nikutils/extensions/nke_string.dart';

extension ContextExtension on BuildContext {
  static DateTime currentBackPressTime;
  unfocusKeyboard() {
    FocusScope.of(this).unfocus();
  }

  toggleFullscreen({bool fullscreen = true}) {
    if (fullscreen)
      SystemChrome.setEnabledSystemUIOverlays([]);
    else
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  push({@required Widget page}) {
    if (page == null || this == null) return;

    Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  pushNamed(String route, {Object args}) {
    if (route.isNullOrEmpty || this == null) return;

    Navigator.pushNamed(this, route, arguments: args);
  }

  pushReplacement({@required Widget page}) {
    if (page == null || this == null) return;
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => page));
  }

  pushReplacementNamed(String route, {Object args}) {
    if (route.isNullOrEmpty || this == null) return;
    Navigator.pushReplacementNamed(this, route, arguments: args);
  }

  pop({bool result}) {
    if (this == null) return;

    if (result != null) {
      Navigator.pop(this, result);
      return;
    }
    Navigator.pop(this);
  }

  double getPercentOfHeight(double percent) {
    return height * percent;
  }

  double getPercentOfWidth(double percent) {
    return width * percent;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }
}
