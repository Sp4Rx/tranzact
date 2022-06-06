import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class PlainText extends StatelessWidget {
  final String data;

  const PlainText(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: TColors.neutral8,
        fontSize: 12,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }
}
