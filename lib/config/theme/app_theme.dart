import 'package:flutter/material.dart';
import '../../core/utils/color_manager.dart';
import '../../core/utils/font_manager.dart';
import '../../core/utils/style_manager.dart';
import '../../core/utils/value_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.white,
    drawerTheme: const DrawerThemeData(),
    fontFamily: FontConstants.fontFamily,
    primaryColor: ColorManager.green,
    // canvasColor: Colors.transparent,
    //bottomsheet theme
    // bottomSheetTheme:
    //     const BottomSheetThemeData(backgroundColor: Colors.transparent),
    // main colors
    // disabledColor: ColorManager.gray,

    //b
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: ColorManager.white,
      selectedItemColor: ColorManager.orange,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.offWhite,
      elevation: AppSize.s0,
      titleTextStyle:
          getBoldStyle(color: ColorManager.offBLACK, fontSize: FontSize.s20),
      iconTheme: IconThemeData(color: ColorManager.offBLACK),
    ),
    // card theme
    cardTheme: CardTheme(
      elevation: AppSize.s10,
      color: ColorManager.offWhite,
    ),

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
        primary: ColorManager.green,
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
      //used

      // displayLarge:
      //     getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
      // bodyLarge:
      //     getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
      // titleSmall:
      //     getSemiBoldStyle(color: ColorManager.red, fontSize: FontSize.s14),
      // bodyMedium:
      //     getBoldStyle(color: ColorManager.gray, fontSize: FontSize.s14),
      // // for text field form label
      // titleMedium:
      //     getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
      // titleLarge:
      //     getBoldStyle(color: ColorManager.black, fontSize: FontSize.s14),
      // bodySmall:
      //     getBoldStyle(color: ColorManager.black, fontSize: FontSize.s20),
      // displayMedium:
      //     getSemiBoldStyle(color: ColorManager.gray, fontSize: FontSize.s16),
      // displaySmall: ,
      headlineLarge:
          getBoldStyle(color: ColorManager.offBLACK, fontSize: FontSize.s18),
      headlineMedium: getSemiBoldStyle(
          color: ColorManager.offWhite, fontSize: FontSize.s16),
      // headlineSmall: ,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // iconColor: ColorManager.yellow,
      //content padding
      contentPadding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      //hint style
      hintStyle:
          getRegularStyle(color: ColorManager.lightSky, fontSize: FontSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.offBLACK, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.red),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
        borderSide: BorderSide(color: ColorManager.lightSky),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.green,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
        borderSide: BorderSide(color: ColorManager.lightSky),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppSize.s10,
        ),
        borderSide: BorderSide(color: ColorManager.lightSky),
      ),
    ),
  );
}
