import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/blocs/app/app_bloc.dart';
import 'package:tranzact/ui/commons/atoms/tranzact_logo_big.dart';
import 'package:tranzact/ui/commons/atoms/wave_container.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();

  static Page page() => const MaterialPage<void>(child: Splash());
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  static const duration = 1;
  bool startAnimating = false;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: duration),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    _controller.forward();
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        //Goto next screen
        context.read<AppBloc>().add(SplashEnded());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _afterLayout(Duration timeStamp) {
    //Should have been done by blocs
    //Using setSate to make it faster
    if (mounted) {
      setState(() {
        startAnimating = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: WaveContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: duration),
            left: 0,
            right: 0,
            top: startAnimating ? 0 : MediaQuery.of(context).size.height / 4,
            bottom: 0,
            child: FadeTransition(
                opacity: _animation, child: const TranzactLogoBig()),
          )
        ],
      ),
    );
  }
}
