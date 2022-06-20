import 'package:flutter/material.dart';
import 'package:musilm_app/features/home/presentation/pages/home_page.dart';
import 'package:musilm_app/features/onboarding/presentation/pages/onboarding_screen.dart';

class Routes {
  static const String onboardingPage = "/";
  static const String homePge = "/home_page";
  static const String quranMainPage = "/quran_main_page";
}

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingPage:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.homePge:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        throw ('this page does not exist');
    }
  }
}
