import 'package:flutter/material.dart';

class NkButton extends StatelessWidget {
  const NkButton(this.text,
      {Key key,
      this.margin,
      this.color,
      this.height,
      this.padding,
      this.onClick,
      this.textStyle,
      this.width = 100,
      this.borderRadius = 10,
      this.formKey})
      : super(key: key);

  final String text;
  final Color color;
  final double borderRadius;
  final double width;
  final double height;
  final Function onClick;
  final TextStyle textStyle;
  final GlobalKey<FormState> formKey;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Container(
        margin: margin,
        padding: padding,
        child: RaisedButton(
          onPressed: onClick,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Container(
              constraints: BoxConstraints(maxWidth: width, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
