import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';
import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurahDetailsBuilder extends StatelessWidget {
  Verse verse;
  SurahDetailsBuilder({
    Key? key,
    required this.verse,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  CustomIcomoon.surahNumberIcon,
                  size: 50,
                  color: ColorManager.grey,
                ),
                Text(
                  verse.verseKey.substring(verse.verseKey.lastIndexOf(':') + 1),
                  style: TextStyle(
                    color: ColorManager.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            // const SizedBox(
            //   width: 15,
            // ),
            Expanded(
              child: Text(
                verse.textUthmani,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Scheherazade New',
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: ColorManager.lightWhite,
        ),
      ],
    );
  }
}
