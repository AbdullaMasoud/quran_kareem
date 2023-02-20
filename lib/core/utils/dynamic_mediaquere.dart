import 'package:flutter/material.dart';

MediaQueryData mediaQueryData(BuildContext context) {
  Size size(BuildContext buildContext) {
    return mediaQueryData(buildContext).size;
  }

  double width(BuildContext buildContext) {
    return size(buildContext).width;
  }

  double height(BuildContext buildContext) {
    return size(buildContext).height;
  }

  return MediaQuery.of(context);
}
