import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:musilm_app/core/utils/assets_manager.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/custom_icons.dart';
import 'package:musilm_app/features/misbaha/presentation/cubit/misbaha_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MisbahaButton extends StatelessWidget {
  const MisbahaButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MisbahaCubit, MisbahaState>(
      builder: (context, state) {
        MisbahaCubit misbahaCubit = MisbahaCubit.get(context);

        return Listener(
          onPointerUp: (event) => misbahaCubit.sibahaButtonPressed(),
          onPointerDown: (event) => misbahaCubit.sibahaButtonClosed(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorManager.white,
                image: const DecorationImage(
                    image: AssetImage(AssetsManager.aser)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: misbahaCubit.blur,
                    offset: -misbahaCubit.distance,
                    color: ColorManager.white,
                    inset: misbahaCubit.isPressed,
                  ),
                  BoxShadow(
                    blurRadius: misbahaCubit.blur,
                    offset: misbahaCubit.distance,
                    color: ColorManager.lightDark,
                    inset: misbahaCubit.isPressed,
                  ), // BoxShadow
                ]),
            child: SizedBox(
              height: 250.h,
              width: 200.w,
              child: Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Icon(
                  (CustomIcon.tasbeehIcon),
                  size: misbahaCubit.misbahaSize,
                  color: ColorManager.darkBlue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
