import 'package:flutter/material.dart';

class NkGrid extends StatefulWidget {
  NkGrid(
      {Key key,
      @required this.columns,
      this.children,
      this.mainAxisAlignment,
      this.crossAxisAlignment})
      : super(key: key);

  final int columns;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  _NkGridState createState() => _NkGridState();
}

class _NkGridState extends State<NkGrid> {
  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainax;
    CrossAxisAlignment crossax;
    if (widget.mainAxisAlignment == null)
      mainax = MainAxisAlignment.center;
    else
      mainax = widget.mainAxisAlignment;

    if (widget.crossAxisAlignment == null)
      crossax = CrossAxisAlignment.start;
    else
      crossax = widget.crossAxisAlignment;

    final column = Column(crossAxisAlignment: crossax, children: [
      for (int i = 0, j = 0; i < widget.children.length / widget.columns; i++)
        Row(
          mainAxisAlignment: mainax,
          children: [
            for (int k = 0; k < widget.columns; j++, k++)
              if (j < widget.children.length) widget.children[j]
          ],
        )
    ]);

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: column);
  }
}
