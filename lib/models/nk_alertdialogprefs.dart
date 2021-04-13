import 'package:flutter/material.dart';

class NkAlertDialogPrefs {
  NkAlertDialogPrefs(this.title, this.message,
      {this.okButtonText = "Ok",
      this.okButtonStyle,
      this.messageStyle,
      this.titleStyle});

  /// Text used in the ok button of the dialog box.
  String okButtonText;

  /// Style of the text used in the ok button of the dialog box.
  TextStyle? okButtonStyle;

  /// Title used in the dialog box.
  String title;

  /// Style of the title used in the dialog box.
  TextStyle? titleStyle;

  /// Message used in the dialog box.
  String message;

  /// Style of the message used the dialog box.
  TextStyle? messageStyle;
}
