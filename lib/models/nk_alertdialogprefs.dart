import 'package:flutter/material.dart';

class NkAlertDialogPrefs {
  NkAlertDialogPrefs(this.title, this.message,
      {this.okButtonText = "Ok",
      this.okButtonStyle,
      this.messageStyle,
      this.titleStyle});

  String okButtonText;
  TextStyle okButtonStyle;
  String title;
  TextStyle titleStyle;
  String message;
  TextStyle messageStyle;
}
