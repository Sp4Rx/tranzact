import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/atoms/brands.dart';
import 'package:tranzact/ui/commons/atoms/colored_line.dart';
import 'package:tranzact/ui/commons/atoms/plain_text.dart';
import 'package:tranzact/ui/commons/image_loader.dart';

class BottomBrands extends StatelessWidget {
  const BottomBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ColoredLine(),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageLoader.assetSvg('images/svg/shield.svg'),
            const SizedBox(
              width: 8,
            ),
            const PlainText('100% Safe & Secure!'),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        const PlainText('Trusted By 10,000+ Manufacturing & Trading SMEs'),
        const SizedBox(
          height: 16,
        ),
        const Brands(),
      ],
    );
  }
}
