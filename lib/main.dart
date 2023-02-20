import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/config/theme/app_theme.dart';
import 'package:musilm_app/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:musilm_app/features/misbaha/presentation/cubit/misbaha_cubit.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/features/surah_details/presentation/cubit/surah_details_cubit.dart';
import 'package:musilm_app/injector.dart' as di;

import 'bloc_observer.dart';
import 'features/azkar_details/presentation/cubit/azkar_cubit.dart';
import 'features/home_page/presentation/cubit/address_cubit/user_address_cubit.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await di.init();
      runApp(
        const MyApp(),
      );
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
          create: (context) => di.getIt<QuranMainPageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<HomePageCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<SurahDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<AzkarCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<MisbahaCubit>(),
        ),
        BlocProvider(
          create: (context) => di.getIt<UserAddressCubit>(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            onGenerateRoute: AppRoute.generateRoute,
          );
        },
      ),
    );
  }
}
