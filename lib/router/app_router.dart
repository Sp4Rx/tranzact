import 'package:flutter/material.dart';
import 'package:tranzact/ui/screens/splash.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routerSettings) {
    switch (routerSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
    }
    return null;
  }
}
