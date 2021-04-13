import 'package:flutter/material.dart';

class NkDialogPrefs {
  NkDialogPrefs(this.children,
      {this.verticalAlignment, this.canUserPop = false});

  /// List of widgets used in dialog boxes.
  List<Widget>? children;

  /// Vertical alignment of the dialog boxes.
  MainAxisAlignment? verticalAlignment;

  /// Determines whether the user will be able to leave the dialog box.
  ///
  /// The default value is false.
  bool canUserPop;
}
