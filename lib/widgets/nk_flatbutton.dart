import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NkFlatButton extends StatefulWidget {
  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final Function onClick;
  final TextStyle textStyle;
  final GlobalKey<FormState> formKey;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Background background;

  NkFlatButton(this.text,
      {Key key,
      this.margin,
      this.height = 40,
      this.padding,
      this.onClick,
      this.textStyle,
      this.width = 90,
      this.borderRadius = 10,
      this.formKey,
      this.background})
      : assert(width >= 90, 'Tamanho mínimo excedido; minWidht = 90.'),
        assert(height >= 40, 'Tamanho mínimo excedido; minHeight = 40.'),
        super(key: key);

  @override
  _NkFlatButtonState createState() => _NkFlatButtonState();
}

class _NkFlatButtonState extends State<NkFlatButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 40.0,
          minWidth: 90,
          maxWidth: widget.width,
          maxHeight: widget.height),
      margin: widget.margin,
      padding: widget.padding,
      child: FlatButton(
        onPressed: widget.onClick,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: widget.width,
                    minHeight: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: widget.background != null
                      ? widget.background.child
                      : Container(),
                ),
                Container(
                  constraints:
                      BoxConstraints(maxWidth: widget.width, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: widget.textStyle,
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
