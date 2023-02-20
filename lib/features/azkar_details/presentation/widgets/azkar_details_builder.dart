import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musilm_app/features/azkar_details/domain/entities/azkar.dart';

class AzkarDetailsBuilder extends StatelessWidget {
  AzkarData azkar;
  AzkarDetailsBuilder({
    Key? key,
    required this.azkar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.shinyGrey,
                ),
                child: Text(
                  azkar.content.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Scheherazade New',
                      fontSize: 20.sp,
                      color: ColorManager.lightBlue),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                azkar.description.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    child: Icon(
                      CustomIcomoon.reapetIcon,
                      size: 40.r,
                      color: ColorManager.black,
                    ),
                  ),
                  Text(
                    azkar.count.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
