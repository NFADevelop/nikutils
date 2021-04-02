import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nikutils/models/nk_colors.dart';

export 'package:nikutils/models/nk_colors.dart';

class NkFlatButton extends StatelessWidget {
  const NkFlatButton(this.text,
      {Key key,
      this.margin,
      this.height = 40,
      this.padding,
      this.onClick,
      this.textStyle,
      this.width = 90,
      this.borderRadius = 10,
      this.formKey,
      this.colors,
      this.background})
      : super(key: key);

  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final Function onClick;
  final TextStyle textStyle;
  final NkColors colors;
  final GlobalKey<FormState> formKey;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Background background;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width, maxHeight: height),
      margin: margin,
      padding: padding,
      child: FlatButton(
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.all(0.0),
        colorBrightness: colors.colorBrightness,
        textColor: colors.textColor,
        focusColor: colors.focusColor,
        hoverColor: colors.hoverColor,
        splashColor: colors.splashColor,
        disabledColor: colors.disabledColor,
        highlightColor: colors.highlightColor,
        disabledTextColor: colors.disabledTextColor,
        child: Ink(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width,
                    minHeight: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: background != null ? background.child : Container(),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Background {
  Background({this.child, this.backgroundColor = Colors.transparent});

  Widget child;
  Color backgroundColor;
}
