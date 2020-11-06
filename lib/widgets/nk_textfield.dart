import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nikutils/extensions/nke_string.dart';

class NkTextField extends StatefulWidget {
  final int maxLines;
  final bool isPassword;
  final Color bgColor;
  final Color focusColor;
  final Color cursorColor;
  final Color textColor;
  final Color underlineColor;
  final double underlineOpacity;

  final Icon leftItem;
  final Icon rightItem;
  final String hintText;
  final TextStyle style;
  final TextInputType keyboardType;
  final String Function(String) validationFunction;
  final Function(String) onChanged;
  final EdgeInsetsGeometry contentPadding;
  final TextEditingController value;
  final List<TextInputFormatter> inputFormatter;
  final bool autoFocus;
  final Widget Function(NkTextFieldBGSets) background;

  static const TextStyle defaultStyle = TextStyle();

  const NkTextField(
      {this.maxLines = 1,
      this.isPassword = false,
      this.bgColor = Colors.transparent,
      this.focusColor = Colors.black87,
      this.textColor = Colors.black87,
      this.underlineColor = Colors.black87,
      this.underlineOpacity = 1,
      this.cursorColor,
      this.leftItem,
      this.rightItem,
      this.hintText = "Hint",
      this.style = defaultStyle,
      this.keyboardType,
      this.validationFunction,
      this.onChanged,
      this.contentPadding,
      this.value,
      this.inputFormatter,
      this.background,
      this.autoFocus = false});

  @override
  _NkTextField createState() => _NkTextField();
}

class _NkTextField extends State<NkTextField> {
  Color statusColor;
  Color statusIconColor;

  final GlobalKey textKey = GlobalKey();
  RenderBox _textRend;
  Size _textSize;
  Size _constSize;
  Widget bg;

  Future getText() {
    return new Future.delayed(const Duration(milliseconds: 10), () {
      _textRend = textKey.currentContext.findRenderObject();
      _textSize = _textRend.size;
      if (_constSize == null) _constSize = _textSize;
      setState(() {
        bg = widget
            .background(NkTextFieldBGSets(statusColor, _textSize, _constSize));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getText();
    return Stack(children: [
      if (bg != null) bg,
      TextFormField(
        key: textKey,
        autofocus: widget.autoFocus,
        controller: widget.value,
        validator: (value) {
          var valid = widget.validationFunction(value);
          if (!valid.isNullOrEmpty) {
            setState(() {
              statusColor = Colors.red;
              statusIconColor = Colors.red;
              getText();
            });
          } else {
            setState(() {
              statusColor = null;
              statusIconColor = null;
              getText();
            });
          }
          return valid;
        },
        cursorColor: widget.cursorColor,
        style: widget.style.merge(TextStyle(
            color: statusColor == null ? widget.textColor : statusColor)),
        obscureText: widget.isPassword,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        textAlignVertical: TextAlignVertical.center,
        scrollPadding: EdgeInsets.all(10),
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          filled: true,
          focusColor: widget.focusColor,
          hintText: widget.hintText,
          fillColor: widget.bgColor,
          prefixIcon: widget.leftItem != null
              ? Container(
                  padding: widget.contentPadding,
                  child: Icon(
                    widget.leftItem.icon,
                    size: widget.leftItem.size,
                    color: statusIconColor,
                  ),
                )
              : null,
          suffixIcon: widget.rightItem != null
              ? Container(
                  padding: widget.contentPadding,
                  child: Icon(
                    widget.rightItem.icon,
                    color: statusIconColor,
                    size: widget.rightItem.size,
                  ),
                )
              : null,
          alignLabelWithHint: true,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent)),
          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: Colors.transparent)),
          errorStyle: TextStyle(fontSize: 15),
        ),
      )
    ]);
  }
}

class NkTextFieldBGSets {
  NkTextFieldBGSets(this.backgroundColor, this.dinamicSize, this.constSize);
  Color backgroundColor;
  Size dinamicSize;
  Size constSize;
}
