import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class ColoredActionText extends StatelessWidget {
  final String data;
  final Color? color;

  final VoidCallback? onPressed;

  ///Default color is [TColors.blueDark]
  const ColoredActionText(
    this.data, {
    Key? key,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        data,
        style: TextStyle(
            color: color ?? TColors.blueDark, fontWeight: FontWeight.bold),
      ),
    );
  }
}
