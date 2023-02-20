import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayTimeSkeleton extends StatelessWidget {
  const PrayTimeSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: const [
            SinglePrayTimeSkeleton(),
            SinglePrayTimeSkeleton(),
            SinglePrayTimeSkeleton(),
          ],
        ),
      ),
    );
  }
}

class SinglePrayTimeSkeleton extends StatelessWidget {
  const SinglePrayTimeSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorManager.darkBlue,
      highlightColor: ColorManager.shinyGrey,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 109.w,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: ColorManager.darkBlue,
        ),
      ),
    );
  }
}
