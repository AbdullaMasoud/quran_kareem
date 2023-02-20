import 'package:flutter/material.dart';
import 'package:musilm_app/features/azkar/presentation/pages/azkar_page.dart';
import 'package:musilm_app/features/azkar_details/presentation/pages/azkar_details_page.dart';
import 'package:musilm_app/features/home_page/presentation/pages/home_page.dart';
import 'package:musilm_app/features/misbaha/presentation/pages/misbaha_azkar_page.dart';
import 'package:musilm_app/features/misbaha/presentation/pages/misbaha_page.dart';
import 'package:musilm_app/features/qiblah/presentation/pages/qibla_page.dart';
import 'package:musilm_app/features/quran_main_page/data/models/chapters_model.dart';
import 'package:musilm_app/features/quran_main_page/presentation/pages/quran_main_page.dart';
import 'package:musilm_app/features/surah_details/presentation/pages/surah_details_page.dart';

class Routes {
  static const String onboardingPage = "/";
  static const String homePge = "/home_page";
  static const String quranMainPage = "/quran_main_page";
  static const String surahDetailspage = "/surah_details_page";
  static const String qiblaPage = "/qibla_screen";
  static const String azkarPage = "/azkar_page";
  static const String azkarDetailsPage = "/azkar_details_page";
  static const String misbahaPage = "/misbaha_page";
  static const String misbahaAzkarPage = "/misbaha_azkar_page";
}

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingPage:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case Routes.homePge:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case Routes.quranMainPage:
        return MaterialPageRoute(builder: (context) => const QuranMainPage());

      case Routes.qiblaPage:
        return MaterialPageRoute(builder: (context) => const QiblaPage());

      case Routes.azkarPage:
        return MaterialPageRoute(builder: (context) => const AzkarPage());

      case Routes.misbahaAzkarPage:
        return MaterialPageRoute(
            builder: (context) => const MisbahaAzkarPage());

      case Routes.misbahaPage:
        final misbahaZekr = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => MisbahaPage(
                  misbahaZekr: misbahaZekr,
                ));

      case Routes.surahDetailspage:
        final chapter = settings.arguments as ChapterModel;
        return MaterialPageRoute(
            builder: (context) => SurahDetailsPage(chapter: chapter));

      case Routes.azkarDetailsPage:
        final azkar = settings.arguments as String;
        return MaterialPageRoute(
            builder: (context) => AzkarDetailsPage(
                  category: azkar,
                ));

      default:
        throw ('this page does not exist');
    }
  }
}



/**
 pray time image center them

 reloading animation

 add sound to misbaha sound 

 add quran mediaplayer 

 qibla color icon and size 

 why 2 state does not load after each other cubit (address, praytime) unless i use .then()
 */