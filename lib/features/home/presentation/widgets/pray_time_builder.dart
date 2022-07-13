import 'package:flutter/material.dart';

import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/home/domain/entities/pray_time.dart';

class PrayTimeBuilder extends StatelessWidget {
  final PrayTime prayTime;
  const PrayTimeBuilder({
    Key? key,
    required this.prayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          singlePrayTimeBuilder('إمساك', prayTime.times.imsak.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('الشروق', prayTime.times.sunrise.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('الفجر', prayTime.times.fajr.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('الظهر', prayTime.times.dhuhr.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('العصر', prayTime.times.asr.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('الغروب', prayTime.times.sunset.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('المغرب', prayTime.times.maghrib.toString()),
          prayTimeDivider(),
          singlePrayTimeBuilder('العشاء', prayTime.times.isha.toString()),
        ],
      ),
    );
  }

  Widget singlePrayTimeBuilder(
    String prayName,
    String prayTime,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: ColorManager.green,
      ),
      child: Row(
        children: [
          Text(
            prayTime,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: ColorManager.offWhite,
            ),
          ),
          const Spacer(),
          Text(
            prayName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ColorManager.offWhite,
            ),
          ),
        ],
      ),
    );
  }

  Widget prayTimeDivider() {
    return const SizedBox(
      height: 14,
    );
  }
}

class Skelton extends StatelessWidget {
  Skelton({
    Key? key,
  }) : super(key: key);

  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.black.withOpacity(0.04),
      ),
    );
  }
}
