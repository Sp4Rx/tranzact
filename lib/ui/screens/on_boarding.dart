import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: OnBoarding());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Hello World')),
    );
  }
}
