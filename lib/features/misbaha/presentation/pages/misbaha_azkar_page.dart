import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musilm_app/features/misbaha/presentation/widgets/misbaha_azkar_list.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/const_manager.dart';
import '../../../../core/wigdets/appbar.dart';

class MisbahaAzkarPage extends StatelessWidget {
  const MisbahaAzkarPage({super.key});

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
                          ConstentManager.tasbeeh,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const MisbahaAzkarList()
        ],
      ),
    );
  }
}
