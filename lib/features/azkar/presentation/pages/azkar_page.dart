import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musilm_app/core/wigdets/appbar.dart';
import 'package:musilm_app/features/azkar/presentation/widgets/azkar_builder.dart';

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              AppBarImageBackGround(hieght: 100.h),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 10.w,
                  right: 40.w,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: ColorManager.offWhite,
                            )),
                        const Spacer(),
                        Text(
                          ConstentManager.azkar,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const AzkarListBuilder(),
        ],
      ),
    );
  }
}
