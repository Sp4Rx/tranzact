import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class BlueText extends StatelessWidget {
  final String data;

  final VoidCallback? onPressed;

  const BlueText(
    this.data, {
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        data,
        style: const TextStyle(
            color: TColors.blueDark, fontWeight: FontWeight.bold),
      ),
    );
  }
}
