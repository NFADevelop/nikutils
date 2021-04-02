import 'package:flutter/material.dart';
export 'package:get/get.dart';

class Nikutils {
  static List<Widget> _loadingDialog;

  static List<Widget> get loadingDialog {
    if (_loadingDialog != null)
      return _loadingDialog;
    else
      return <Widget>[
        Container(width: 50, height: 50, child: CircularProgressIndicator()),
      ];
  }

  static set loadingDialog(List<Widget> value) {
    _loadingDialog = value;
  }

  static MaterialColor customMaterialColor(int hex) {
    Color color = Color(hex);
    int r = color.red;
    int g = color.green;
    int b = color.blue;
    return MaterialColor(hex, {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    });
  }
}
