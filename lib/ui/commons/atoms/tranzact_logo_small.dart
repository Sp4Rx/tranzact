import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/image_loader.dart';

class TranzactLogoSmall extends StatelessWidget {
  const TranzactLogoSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageLoader.asset('images/tranzact_logo_small.png');
  }
}
