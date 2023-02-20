import 'package:flutter/widgets.dart';

class CustomIcon {
  CustomIcon._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData quranIcon =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData duaaIcon =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData compassIcon =
      IconData(0xe809, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData tasbeehIcon =
      IconData(0xe803, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

// IconData(0xe900, fontFamily: 'icomoon')

// ea2e

class CustomIcomoon {
  CustomIcomoon._();

  static const _icomoon = 'icomoon';
  static const IconData surahNumberIcon =
      IconData(0xe900, fontFamily: _icomoon);
  static const IconData reapetIcon = IconData(0xe901, fontFamily: _icomoon);
}
