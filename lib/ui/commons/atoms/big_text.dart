import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String title;

  const BigText(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
