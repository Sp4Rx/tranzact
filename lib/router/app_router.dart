import 'package:flutter/widgets.dart';
import 'package:tranzact/blocs/app/app_bloc.dart';
import 'package:tranzact/ui/screens/home_screen.dart';
import 'package:tranzact/ui/screens/login_screen.dart';
import 'package:tranzact/ui/screens/on_boarding_carousel.dart';
import 'package:tranzact/ui/screens/splash.dart';

class AppRouter {
  static List<Page> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
  ) {
    switch (state) {
      case AppStatus.home:
        return [HomeScreen.page()];
      case AppStatus.login:
        return [LoginScreen.page()];
      case AppStatus.splash:
        return [Splash.page()];
      case AppStatus.onBoarding:
        return [OnBoardingCarousel.page()];
    }
  }
}
