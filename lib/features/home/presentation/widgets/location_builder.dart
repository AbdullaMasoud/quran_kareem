import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/home/presentation/cubit/cubit/test_cubit.dart';

class LocationBuilder extends StatefulWidget {
  const LocationBuilder({Key? key}) : super(key: key);

  @override
  State<LocationBuilder> createState() => _LocationBuilderState();
}

class _LocationBuilderState extends State<LocationBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        var homeCubit = TestCubit.get(context);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              homeCubit.country ?? '',
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.lightSky,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' - ',
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.lightSky,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              homeCubit.locality ?? "",
              style: TextStyle(
                fontSize: 20,
                color: ColorManager.lightSky,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
