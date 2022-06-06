import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CircleIconButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor: MaterialStateProperty.all(TColors.secondaryDefault),
      ),
      child: const Icon(Icons.chevron_right),
    );
  }
}
