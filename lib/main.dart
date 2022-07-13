import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:musilm_app/bloc_observer.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/config/theme/app_theme.dart';
import 'package:musilm_app/features/bottom_navigation_bar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:musilm_app/features/home/presentation/cubit/cubit/test_cubit.dart';
import 'package:musilm_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/features/surah_details/presentation/cubit/surah_details_cubit.dart';
import 'package:musilm_app/injector.dart' as di;

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await di.init();
      initializeDateFormatting().then((_) => runApp(const MyApp()));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.getIt<BottomNavigationBarCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<QuranMainPageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<SurahDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<TestCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
