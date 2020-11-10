import 'package:flutter/material.dart';

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
}
