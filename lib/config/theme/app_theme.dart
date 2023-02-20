import 'package:flutter/material.dart';
import '../../core/utils/color_manager.dart';
import '../../core/utils/font_manager.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/value_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    fontFamily: FontConstants.fontFamily,

    // app bar theme
    // appBarTheme: AppBarTheme(
    //   color: ColorManager.offWhite,
    //   elevation: AppSize.s0,
    //   titleTextStyle:
    //       getBoldStyle(color: ColorManager.offBLACK, fontSize: FontSize.s20),
    //   iconTheme: const IconThemeData(color: ColorManager.offWhite),
    // ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      buttonColor: ColorManager.green,
      splashColor: ColorManager.green,
      disabledColor: ColorManager.lightSky,
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.green,
        textStyle: getBoldStyle(
          color: ColorManager.offWhite,
          fontSize: FontSize.s25,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
      displayMedium:
          getBoldStyle(color: ColorManager.lightSky, fontSize: FontSize.s20),
      displaySmall:
          getBoldStyle(color: ColorManager.offWhite, fontSize: FontSize.s30),
      headlineLarge:
          getBoldStyle(color: ColorManager.offWhite, fontSize: FontSize.s20),
      headlineMedium:
          getBoldStyle(color: ColorManager.offWhite, fontSize: FontSize.s14),
      headlineSmall:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
      labelLarge:
          getBoldStyle(color: ColorManager.offWhite, fontSize: FontSize.s15),
      labelMedium:
          getBoldStyle(color: ColorManager.lightBlue, fontSize: FontSize.s18),
      labelSmall:
          getBoldStyle(color: ColorManager.grey, fontSize: FontSize.s12),
      titleSmall:
          getBoldStyle(color: ColorManager.darkBlue, fontSize: FontSize.s12),
      titleMedium:
          getBoldStyle(color: ColorManager.lightBlue, fontSize: FontSize.s25),
    ),
  );
}
