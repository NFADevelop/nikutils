import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NkFlatButton extends StatelessWidget {
  const NkFlatButton(this.text,
      {Key? key,
      this.height = 40,
      this.padding,
      this.onClick,
      this.onLongClick,
      this.textStyle,
      this.width = 90,
      this.formKey,
      this.style,
      this.background})
      : super(key: key);

  /// Main button text.
  final String text;

  /// Button width, placed in an aggregate container.
  final double width;

  /// Button height, placed in an aggregate container.
  final double height;

  /// Primary click function.
  final Function? onClick;

  /// Long press click.
  final Function? onLongClick;

  /// Button style, if null uses the default theme.
  final TextStyle? textStyle;

  /// Style of the button.
  final ButtonStyle? style;

  /// Button form key.
  final GlobalKey<FormState>? formKey;

  /// Button padding if null uses padding of style.
  ///
  /// If the button style padding has value, it is preferred.
  final EdgeInsetsGeometry? padding;

  /// The button's background is equivalent to a stack with the Container and the Button.
  final Background? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onClick as void Function()?,
        onLongPress: onLongClick as void Function()?,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          padding ?? EdgeInsets.all(0),
        )).merge(style),
        child: Ink(
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
                  child: background != null ? background!.child : Container(),
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

  Widget? child;
  Color backgroundColor;
}
