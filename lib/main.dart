import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/config/theme/app_theme.dart';
import 'package:musilm_app/features/quran_main_page/presentation/cubit/quran_main_page_cubit.dart';
import 'package:musilm_app/injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<QuranMainPageCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
