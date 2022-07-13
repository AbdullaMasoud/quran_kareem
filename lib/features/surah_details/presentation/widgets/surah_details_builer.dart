import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/surah_details/domain/entities/surah_details.dart';

class SurahDetailsBuilder extends StatelessWidget {
  Verse verse;
  SurahDetailsBuilder({
    Key? key,
    required this.verse,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: 15,
        // ),
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    'assets/images/verses.png',
                  ),
                  height: 50,
                  width: 50,
                ),
                Text(
                  verse.verseKey.substring(verse.verseKey.lastIndexOf(':') + 1),
                  style: TextStyle(
                    color: ColorManager.green,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                verse.textUthmani,
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Scheherazade New',
                  fontSize: 18,
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
