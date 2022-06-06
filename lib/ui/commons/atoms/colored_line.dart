import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class ColoredLine extends StatelessWidget {
  final Color? color;

  ///Default color is [TColor.secondaryBorderLighter]
  const ColoredLine({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color ?? TColors.secondaryBorderLighter,
    );
  }
}
