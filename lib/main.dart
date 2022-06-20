import 'package:flutter/material.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
