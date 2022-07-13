import 'package:flutter/material.dart';
import 'package:musilm_app/features/bottom_navigation_bar/presentation/pages/bottom_navigation_bar.dart';
import 'package:musilm_app/features/home/presentation/pages/home_page.dart';
import 'package:musilm_app/features/home/presentation/widgets/shimmer_ex.dart';
import 'package:musilm_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:musilm_app/features/quran_main_page/data/models/chapters_model.dart';
import 'package:musilm_app/features/quran_main_page/presentation/pages/quran_main_page.dart';
import 'package:musilm_app/features/surah_details/presentation/pages/surah_details_page.dart';

class Routes {
  static const String onboardingPage = "/";
  static const String bottomNavigation = "/bottom_navigation_bar";
  static const String homePge = "/home_page";
  static const String quranMainPage = "/quran_main_page";
  static const String surahDetailspage = "/surah_details_page";
  static const String shimmer = "/shimmer_ex";
}

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingPage:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case Routes.homePge:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case Routes.quranMainPage:
        return MaterialPageRoute(builder: (context) => const QuranMainPage());
      case Routes.bottomNavigation:
        return MaterialPageRoute(
            builder: (context) => const MainBottomNavigationBar());
      case Routes.shimmer:
        return MaterialPageRoute(
            builder: (context) => const ExampleUiLoadingAnimation());
      case Routes.surahDetailspage:
        final chapter = settings.arguments as ChapterModel;
        return MaterialPageRoute(
            builder: (context) => SurahDetailsPage(
                  chapter: chapter,
                ));
      default:
        throw ('this page does not exist');
    }
  }
}
