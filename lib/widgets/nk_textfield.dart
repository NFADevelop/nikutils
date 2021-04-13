import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NkTextField extends StatefulWidget {
  final int maxLines;
  final bool isPassword;
  final Color bgColor;
  final Color focusColor;
  final Color? cursorColor;
  final Color textColor;
  final Color customBgColor;
  final Color underlineColor;
  final double underlineOpacity;
  final Icon? leftItem;
  final Icon? rightItem;
  final String hintText;
  final TextStyle style;
  final TextInputType? keyboardType;
  final String Function(String?)? validationFunction;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? value;
  final List<TextInputFormatter>? inputFormatter;
  final bool autoFocus;
  final Widget Function(NkTextFieldBGSets)? background;

  static const TextStyle defaultStyle = TextStyle();

  const NkTextField(
      {this.maxLines = 1,
      this.isPassword = false,
      this.bgColor = Colors.transparent,
      this.focusColor = Colors.black87,
      this.textColor = Colors.black87,
      this.underlineColor = Colors.black87,
      this.customBgColor = Colors.transparent,
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
  Color? statusColor;
  Color? statusIconColor;

  final GlobalKey textKey = GlobalKey();
  Widget? bg;
  Size? size;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => postFrameCallback());
  }

  void postFrameCallback() {
    var context = textKey.currentContext;
    if (context == null) return;

    var newSize = context.size;
    if (size == newSize) {
      setState(() {
        size = newSize;
      });
      return;
    }

    setState(() {
      size = newSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.background != null && textKey.currentContext != null) {
      var bgSets = NkTextFieldBGSets(
          statusColor == null ? widget.customBgColor : statusColor, size);

      bg = widget.background!(bgSets);
    }
    return Stack(children: [
      if (bg != null) bg!,
      TextFormField(
        key: textKey,
        autofocus: widget.autoFocus,
        controller: widget.value,
        validator: (value) {
          if (widget.validationFunction != null) {
            var valid = widget.validationFunction!(value);
            if (valid.isNotEmpty) {
              setState(() {
                statusColor = Colors.red;
                statusIconColor = Colors.red;
                size = size;
              });
            } else {
              setState(() {
                statusColor = null;
                statusIconColor = null;
                size = size;
              });
            }
            return valid;
          }
          return null;
        },
        cursorColor: widget.cursorColor,
        style: widget.style.merge(TextStyle(
            color: statusColor == null ? widget.textColor : statusColor)),
        obscureText: widget.isPassword,
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
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
                    widget.leftItem!.icon,
                    size: widget.leftItem!.size,
                    color: statusIconColor,
                  ),
                )
              : null,
          suffixIcon: widget.rightItem != null
              ? Container(
                  padding: widget.contentPadding,
                  child: Icon(
                    widget.rightItem!.icon,
                    color: statusIconColor,
                    size: widget.rightItem!.size,
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
          errorStyle: TextStyle(
            fontSize: 15,
          ),
        ),
      )
    ]);
  }
}

class NkTextFieldBGSets {
  NkTextFieldBGSets(this.borderColor, this.constSize);
  Color? borderColor;
  Size? constSize;
}
