import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension StateExtension<T extends StatefulWidget> on State<T> {
  void nkSetState(void Function() fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }
}
