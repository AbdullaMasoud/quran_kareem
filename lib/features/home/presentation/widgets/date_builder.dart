import 'package:flutter/material.dart';

import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/home/domain/entities/pray_time.dart';

class DateBuilder extends StatelessWidget {
  final Date date;
  const DateBuilder({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          replaceToArabicNumber(date.hijri.year.toString()),
          style: TextStyle(
            fontSize: 20,
            color: ColorManager.lightSky,
            fontWeight: FontWeight.bold,
          ),
        ),
        widthSpacing(),
        Text(
          date.hijri.month.monthAr.toString(),
          style: TextStyle(
            fontSize: 20,
            color: ColorManager.lightSky,
            fontWeight: FontWeight.bold,
          ),
        ),
        widthSpacing(),
        Text(
          replaceToArabicNumber(date.hijri.day.toString()),
          style: TextStyle(
            fontSize: 20,
            color: ColorManager.lightSky,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget widthSpacing() {
    return const SizedBox(
      width: 5,
    );
  }

// todo move to cubit logic
  String replaceToArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }
}
