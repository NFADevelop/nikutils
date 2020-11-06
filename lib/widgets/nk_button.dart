import 'package:flutter/material.dart';

class NkButton extends StatelessWidget {
  const NkButton(this.text,
      {Key key,
      this.margin,
      this.color,
      this.height = 40,
      this.padding,
      this.onClick,
      this.textStyle,
      this.width = 90,
      this.borderRadius = 10,
      this.formKey,
      this.background})
      : assert(
            background == null || color == null,
            'Impossivel usar uma cor com um widget de fundo\n'
            'Escolha entre um widget de fundo ou uma cor.'),
        assert(width >= 90, 'Tamanho mínimo excedido; minWidht = 90.'),
        assert(height >= 40, 'Tamanho mínimo excedido; minHeight = 40.'),
        super(key: key);

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
  final Background background;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: 40.0, minWidth: 90, maxWidth: width, maxHeight: height),
      margin: margin,
      padding: padding,
      child: RaisedButton(
        onPressed: onClick,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
          child: Container(
            width: width,
            height: height,
            constraints: BoxConstraints(
                minHeight: 40.0,
                minWidth: 90,
                maxWidth: width,
                maxHeight: height),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
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
