import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/atoms/dual_color_text.dart';
import 'package:tranzact/ui/commons/atoms/plain_text.dart';
import 'package:tranzact/ui/commons/image_loader.dart';

class OnBoardingItem extends StatelessWidget {
  final String svgImage;
  final String text1;
  final String text2;
  final String descriptionText;

  const OnBoardingItem({
    Key? key,
    required this.svgImage,
    required this.text1,
    required this.text2,
    required this.descriptionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageLoader.assetSvg(svgImage),
        const SizedBox(
          height: 40,
        ),
        DualColorText(text1: text1, text2: text2),
        const SizedBox(
          height: 8,
        ),
        PlainText(descriptionText),
      ],
    );
  }
}
