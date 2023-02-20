import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:musilm_app/core/utils/color_manager.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: ColorManager.offWhite,
      size: 30.0,
    );
  }
}
