import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranzact/blocs/app/app_bloc.dart';
import 'package:tranzact/core/constant.dart';
import 'package:tranzact/models/on_board_model.dart';
import 'package:tranzact/ui/commons/atoms/circle_icon_button.dart';
import 'package:tranzact/ui/commons/atoms/colored_action_text.dart';
import 'package:tranzact/ui/commons/atoms/dots_indicator.dart';
import 'package:tranzact/ui/commons/molecules/onboarding_item.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class OnBoardingCarousel extends StatefulWidget {
  const OnBoardingCarousel({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: OnBoardingCarousel());

  @override
  State<OnBoardingCarousel> createState() => _OnBoardingCarouselState();
}

class _OnBoardingCarouselState extends State<OnBoardingCarousel> {
  final List<OnBoardModel> _items = Constant.onBoardItems;

  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.ease;
  final _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 60,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                    scrollBehavior: const MaterialScrollBehavior()
                        .copyWith(overscroll: false),
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    itemBuilder: (context, index) {
                      final OnBoardModel item = _items[index];
                      return OnBoardingItem(
                        svgImage: item.svgImage,
                        text1: item.text1,
                        text2: item.text2,
                        descriptionText: item.descriptionText,
                      );
                    },
                    itemCount: _items.length),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ColoredActionText(
                    'Skip',
                    onPressed: () =>
                        context.read<AppBloc>().add(OnBoardingCarouselDone()),
                    color: TColors.secondaryDefault,
                  ),
                  DotsIndicator(
                    color: TColors.secondaryDefault,
                    secondaryColor: TColors.neutral6,
                    controller: _controller,
                    itemCount: _items.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _duration,
                        curve: _curve,
                      );
                    },
                  ),
                  CircleIconButton(onPressed: () {
                    if ((_controller.page ?? 0) >= _items.length - 1) {
                      context.read<AppBloc>().add(OnBoardingCarouselDone());
                    } else {
                      _controller.nextPage(duration: _duration, curve: _curve);
                    }
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
