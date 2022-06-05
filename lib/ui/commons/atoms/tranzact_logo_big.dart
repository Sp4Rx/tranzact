import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/Image_loader.dart';

class TranzactLogoBig extends StatelessWidget {
  const TranzactLogoBig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageLoader.asset('images/tranzact_logo.png');
  }
}
