import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/azkar/domain/entities/azkar_list_by_category.dart';
import 'package:musilm_app/features/azkar_details/presentation/pages/azkar_details_page.dart';

class AzkarListBuilder extends StatelessWidget {
  const AzkarListBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: azkarList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 2, indent: 20, endIndent: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
                right: 10.w, left: 10.w, top: 15.h, bottom: 15.h),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AzkarDetailsPage(
                      category: azkarList[index],
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                      radius: 20.r,
                      backgroundColor: ColorManager.darkBlue,
                      child: const Icon((Icons.arrow_back_ios_new_rounded))),
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      azkarList[index],
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorManager.darkBlue,
                    child: Text(
                      "${index + 1}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
