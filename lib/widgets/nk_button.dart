import 'package:flutter/material.dart';

class NkButton extends StatelessWidget {
  const NkButton(this.text,
      {Key? key,
      this.style,
      this.height = 40,
      this.padding,
      this.onClick,
      this.onLongClick,
      this.textStyle,
      this.decoration,
      this.width = 90,
      this.formKey})
      : super(key: key);

  /// Main button text.
  final String text;

  /// Style of the button.
  final ButtonStyle? style;

  /// Button width, placed in an aggregate container.
  final double width;

  /// Button height, placed in an aggregate container.
  final double height;

  /// Button height.
  final Decoration? decoration;

  /// Primary click function.
  final Function? onClick;

  /// Long press click.
  final Function? onLongClick;

  /// Button style, if null uses the default theme.
  final TextStyle? textStyle;

  /// Button form key.
  final GlobalKey<FormState>? formKey;

  /// Button padding if null uses padding of style.
  ///
  /// If the button style padding has value, it is preferred.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onClick as void Function()?,
        onLongPress: onLongClick as void Function()?,
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          padding ?? EdgeInsets.all(10),
        )).merge(style),
        child: Ink(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
