import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';
import 'package:musilm_app/features/quran_main_page/domain/entities/chapters.dart';
import 'package:musilm_app/features/surah_details/presentation/pages/surah_details_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
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
                    Text(chapters.arabicName.toString(),
                        style: Theme.of(context).textTheme.labelMedium),
                    Row(
                      children: [
                        Text("${_formatAyahString(chapters.versesCount)}-",
                            style: Theme.of(context).textTheme.labelSmall),
                        Text(chapters.versesCount.toString(),
                            style: Theme.of(context).textTheme.labelSmall),
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      CustomIcomoon.surahNumberIcon,
                      size: 40.r,
                      color: ColorManager.grey,
                    ),
                    Text(chapters.id.toString(),
                        // chapters.pages!.first.toString(),
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          indent: 10,
          endIndent: 10,
        ),
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
