import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:musilm_app/core/wigdets/appbar.dart';
import 'package:musilm_app/features/misbaha/presentation/widgets/misbaha_counter.dart';
import 'package:musilm_app/features/misbaha/presentation/widgets/reset_button.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/const_manager.dart';
import '../widgets/misbaha_button.dart';

class MisbahaPage extends StatefulWidget {
  String misbahaZekr;
  MisbahaPage({
    Key? key,
    required this.misbahaZekr,
  }) : super(key: key);

  @override
  State<MisbahaPage> createState() => _MisbahaPageState();
}

class _MisbahaPageState extends State<MisbahaPage> {
  // _misbahaBlocBuilder() {
  //   return BlocBuilder<MisbahaCubit, MisbahaState>(
  //     builder: (context, state) {
  //       return const MisbahaButton();
  //     },
  //   );
  // }

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
          MisbahaCounter(
            misbhaZekr: widget.misbahaZekr,
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: MisbahaButton(),
          ),
        ],
      ),
      floatingActionButton: const RestButton(),
    );
  }
}
