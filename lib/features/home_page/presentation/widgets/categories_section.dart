import 'package:flutter/material.dart';
import 'package:musilm_app/config/routes/route.dart';

import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/core/utils/value_manager.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleCategoryBuilder(
              categoryIcon: CustomIcon.quranIcon,
              categoryName: ConstentManager.quranKarem,
              categoryColor: ColorManager.darkBlue,
              onPress: () {
                Navigator.pushNamed(context, Routes.quranMainPage);
              },
            ),
            SingleCategoryBuilder(
              categoryIcon: CustomIcon.compassIcon,
              categoryName: ConstentManager.qibla,
              categoryColor: ColorManager.lightBlue,
              onPress: () {
                Navigator.pushNamed(context, Routes.qiblaPage);
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleCategoryBuilder(
              categoryIcon: CustomIcon.tasbeehIcon,
              categoryName: ConstentManager.tasbeeh,
              categoryColor: ColorManager.darkOrange,
              onPress: () {
                Navigator.pushNamed(context, Routes.misbahaAzkarPage);
              },
            ),
            SingleCategoryBuilder(
              categoryIcon: CustomIcon.duaaIcon,
              categoryName: ConstentManager.azkar,
              categoryColor: ColorManager.darkPurple,
              onPress: () {
                Navigator.pushNamed(context, Routes.azkarPage);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class CategoriesString extends StatelessWidget {
  const CategoriesString({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppHieght.h2),
      child: Column(
        children: [
          Text(
            'الأقسام',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(
            thickness: 2,
            indent: 40,
            endIndent: 40,
          ),
        ],
      ),
    );
  }
}

class SingleCategoryBuilder extends StatelessWidget {
  VoidCallback onPress;
  String categoryName;
  IconData categoryIcon;
  Color categoryColor;
  SingleCategoryBuilder({
    Key? key,
    required this.onPress,
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(AppRadius.r10),
            padding: EdgeInsets.all(AppRadius.r10),
            decoration: BoxDecoration(
              color: categoryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              categoryIcon,
              color: ColorManager.white,
              size: AppRadius.r55,
            ),
          ),
          Text(
            categoryName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
