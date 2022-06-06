import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/image_loader.dart';

class Brands extends StatelessWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 40,
      children: [
        ImageLoader.asset('images/brand1.png'),
        ImageLoader.asset('images/brand2.png'),
        ImageLoader.asset('images/brand3.png'),
        ImageLoader.asset('images/brand4.png'),
      ],
    );
  }
}
