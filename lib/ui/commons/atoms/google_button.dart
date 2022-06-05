import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/image_loader.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const GoogleButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
                width: 1,
                color: (onPressed == null)
                    ? TColors.neutral6
                    : TColors.secondaryBorder),
          ),
          primary: (onPressed == null) ? TColors.neutral6 : Colors.white,
          onSurface:
              (onPressed == null) ? TColors.neutral6 : TColors.secondaryBorder,
          padding: const EdgeInsets.symmetric(vertical: 14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageLoader.assetSvg('images/svg/google_logo.svg'),
          const SizedBox(
            width: 12,
          ),
          Text(
            text,
            style: TextStyle(
              color: (onPressed == null) ? TColors.neutral6 : TColors.neutral10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
