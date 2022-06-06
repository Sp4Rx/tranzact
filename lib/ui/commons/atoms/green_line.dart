import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class GreenLine extends StatelessWidget {
  const GreenLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      color: TColors.secondaryBorderLighter,
    );
  }
}
