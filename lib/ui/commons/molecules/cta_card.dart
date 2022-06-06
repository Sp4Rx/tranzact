import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/atoms/big_text.dart';
import 'package:tranzact/ui/commons/atoms/colored_action_text.dart';
import 'package:tranzact/ui/commons/atoms/shadow_container.dart';
import 'package:tranzact/ui/commons/image_loader.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class CtaCard extends StatelessWidget {
  final String? image;
  final String subTitle;
  final String title;

  const CtaCard(
      {Key? key, this.image, required this.subTitle, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(
                title,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  ColoredActionText(
                    subTitle,
                    color: TColors.secondaryDefault,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: TColors.secondaryDefault,
                  ),
                ],
              )
            ],
          ),
          (image != null)
              ? ImageLoader.assetSvg(image!)
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
