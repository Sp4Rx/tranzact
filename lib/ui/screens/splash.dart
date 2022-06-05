import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/atoms/tranzact_logo_big.dart';
import 'package:tranzact/ui/commons/atoms/wave_container.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: WaveContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: TranzactLogoBig(),
          )
        ],
      ),
    );
  }
}
