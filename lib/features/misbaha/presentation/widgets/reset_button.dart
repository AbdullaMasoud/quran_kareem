import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/misbaha/presentation/cubit/misbaha_cubit.dart';

class RestButton extends StatelessWidget {
  const RestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      backgroundColor: ColorManager.lightBlue,
      onPressed: () {
        MisbahaCubit.get(context).reset();
      },
      child: const Icon(
        Icons.repeat,
      ),
    );
  }
}
