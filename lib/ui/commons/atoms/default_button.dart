import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool? isDisabled;

  const DefaultButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!(isDisabled ?? false)) {
          onPressed?.call();
        }
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
                width: 1,
                color: (_checkEnabled())
                    ? TColors.neutral6
                    : TColors.secondaryDefault),
          ),
          primary:
              (_checkEnabled()) ? TColors.neutral3 : TColors.secondaryDefault,
          onSurface:
              (_checkEnabled()) ? TColors.neutral6 : TColors.secondaryDefault,
          padding: const EdgeInsets.symmetric(vertical: 14)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: (_checkEnabled()) ? TColors.neutral6 : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  bool _checkEnabled() {
    return (onPressed == null || (isDisabled ?? false));
  }
}
