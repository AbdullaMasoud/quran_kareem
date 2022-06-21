import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';

class ChaptersList extends StatelessWidget {
  final Chapters chapters;
  const ChaptersList({
    Key? key,
    required this.chapters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: ColorManager.green,
              child: Text(
                chapters.chapters![1].pages!.first.toString(),
                style: TextStyle(
                  color: ColorManager.lightWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapters.chapters![1].arabicName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      // Text(
                      //   chapters.chapters![1].revelationPlace.toString(),
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 14,
                      //       color: ColorManager.lightSky),
                      // ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "آيه-${chapters.chapters![1].versesCount} ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: ColorManager.lightSky),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
