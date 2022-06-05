import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class WaveContainer extends StatefulWidget {
  final Duration? duration;
  final double height;
  final double width;
  final List<Color>? waveColors;

  const WaveContainer({
    Key? key,
    this.duration,
    required this.height,
    required this.width,
    this.waveColors,
  }) : super(key: key);

  @override
  State<WaveContainer> createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  Duration? _duration;
  late List<Color> _waveColors;

  @override
  void initState() {
    super.initState();

    _duration = widget.duration ?? const Duration(milliseconds: 4000);
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _waveColors = widget.waveColors ?? [TColors.gradient1, TColors.gradient2];

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: _WavePainter(_animationController, _waveColors),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}

class _WavePainter extends CustomPainter {
  Animation<double> waveAnimation;
  List<Color> waveColor;

  _WavePainter(this.waveAnimation, this.waveColor);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i,
          sin((i / size.width * 2 * pi) + (waveAnimation.value * 2 * pi)) * 20);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    Paint wavePaint = Paint()
      ..shader = LinearGradient(
          colors: waveColor,
          begin: Alignment.bottomRight,
          stops: const [0.1, 0.9]).createShader(Rect.fromCenter(
        center: const Offset(0, 0),
        height: size.width,
        width: 0,
      ));
    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
