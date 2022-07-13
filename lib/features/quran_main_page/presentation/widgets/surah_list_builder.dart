import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/surah_details/presentation/pages/surah_details_page.dart';

class ChaptersList extends StatelessWidget {
  final Chapter chapters;
  const ChaptersList({
    Key? key,
    required this.chapters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahDetailsPage(
                      chapter: chapters,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    chapters.arabicName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "${_formatAyahString(chapters.versesCount)}-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: ColorManager.lightSky),
                      ),
                      Text(
                        chapters.versesCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: ColorManager.lightSky),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundColor: ColorManager.green,
                child: Text(
                  chapters.pages!.first.toString(),
                  style: TextStyle(
                    color: ColorManager.lightWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

// todo move to cubit logic
  String _formatAyahString(int? ayah) {
    String oneDigitAyah = 'أيآت';
    String twoDigitAyah = 'أيه';
    if (ayah! <= 10) {
      return oneDigitAyah;
    } else {
      return twoDigitAyah;
    }
  }
}
