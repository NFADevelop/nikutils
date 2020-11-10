import 'package:flutter/material.dart';

class NkDialogPrefs {
  NkDialogPrefs(this.children,
      {this.verticalAlignment, this.canUserPop = false});

  List<Widget> children;
  MainAxisAlignment verticalAlignment;
  bool canUserPop;
}
