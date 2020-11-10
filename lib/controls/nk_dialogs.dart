import 'package:flutter/material.dart';
import 'package:nikutils/models/nk_alertdialogprefs.dart';
import 'package:nikutils/models/nk_dialogprefs.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/widgets/nk_flatbutton.dart';

import 'package:nikutils/extensions/nke_context.dart';

export 'package:nikutils/models/nk_alertdialogprefs.dart';
export 'package:nikutils/models/nk_dialogprefs.dart';

class NkDialogs {
  static showLoading(BuildContext context, {NkDialogPrefs prefs}) {
    if (prefs == null) {
      prefs = NkDialogPrefs(Nikutils.loadingDialog,
          verticalAlignment: MainAxisAlignment.center);
    }
    showDialog(
        useRootNavigator: false,
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: prefs.canUserPop
                ? Column(
                    mainAxisAlignment: prefs.verticalAlignment,
                    children: prefs.children)
                : WillPopScope(
                    child: Column(
                        mainAxisAlignment: prefs.verticalAlignment,
                        children: prefs.children),
                    onWillPop: _popLoadingCallback),
          );
        });
  }

  static hideLoading(BuildContext context) => Navigator.of(context).pop(false);

  static Future<bool> _popLoadingCallback() async => false;

  static showAlertDialog(BuildContext context, {NkAlertDialogPrefs prefs}) {
    Widget okButton = NkFlatButton(
      prefs.okButtonText,
      height: 40,
      width: 50,
      textStyle: prefs.okButtonStyle == null
          ? TextStyle(fontSize: 18)
          : prefs.okButtonStyle.merge(TextStyle(fontSize: 18)),
      onClick: () => context.pop(),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Material(
                color: Colors.transparent,
                child: Center(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                  height: constraints.maxHeight * .25,
                  width: constraints.maxWidth * .7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(prefs.title,
                                style: prefs.titleStyle == null
                                    ? TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)
                                    : prefs.titleStyle.merge(TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(prefs.message,
                                  style: prefs.messageStyle == null
                                      ? TextStyle(fontSize: 18)
                                      : prefs.messageStyle
                                          .merge(TextStyle(fontSize: 18))),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [okButton],
                      )
                    ],
                  ),
                )));
          },
        );
      },
    );
  }

  static showWidgetDialog(BuildContext context, {@required Widget child}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Material(
              color: Colors.transparent,
              child: child,
            );
          },
        );
      },
    );
  }
}
