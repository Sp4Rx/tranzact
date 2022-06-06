import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class DualColorText extends StatelessWidget {
  final String text1;
  final String text2;
  final Color? color1;
  final Color? color2;
  final double? fontSize;

  const DualColorText({
    Key? key,
    required this.text1,
    required this.text2,
    this.color1,
    this.color2,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          text1,
          style: _defaultTextStyle(),
        ),
        Text(
          ' ',
          style: _defaultTextStyle(),
        ),
        Text(
          text2,
          style: _defaultTextStyle().copyWith(
            color: TColors.secondaryDefault,
          ),
        ),
      ],
    );
  }

  TextStyle _defaultTextStyle() {
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: FontWeight.w600,
      color: color1 ?? Colors.black,
    );
  }
}
