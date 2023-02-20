import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/core/wigdets/loading_annimation.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_state.dart';

class PrayTimeSliderBuilder extends StatefulWidget {
  // final PrayTime prayTime;
  const PrayTimeSliderBuilder({
    Key? key,
    // required this.prayTime,
  }) : super(key: key);

  @override
  State<PrayTimeSliderBuilder> createState() => _PrayTimeSliderBuilderState();
}

class _PrayTimeSliderBuilderState extends State<PrayTimeSliderBuilder> {
  List ts = [];
  Widget _prayTimeBlocBuilder(int index) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state is PrayTimeLoadingState) {
          return const LoadingAnimation();
        } else if (state is PrayTimeErrorState) {
          return Center(child: Text(state.msg));
        } else if (state is PrayTimeLoadedState) {
          ts = state.prayTime.prayTime.times.props.toList();
          return TextTime(prayTime: ts[index]);
        } else {
          return const Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: LoadingAnimation(),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var homeCubit = HomePageCubit.get(context);
    return ListView.builder(
      reverse: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      itemCount: homeCubit.sliderPray.length,
      itemBuilder: (BuildContext context, int index) {
        return SinglePrayTimeBuilder(
            image: homeCubit.sliderPray.values.elementAt(index),
            prayName: homeCubit.sliderPray.keys.elementAt(index),
            prayTime: _prayTimeBlocBuilder(index));
      },
    );
  }
}

class SinglePrayTimeBuilder extends StatelessWidget {
  final String image;
  final String prayName;
  final Widget prayTime;
  const SinglePrayTimeBuilder({
    Key? key,
    required this.image,
    required this.prayName,
    required this.prayTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        // vertical: 30,
      ),
      // height: 190.h,
      width: 109.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          // alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              prayName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const Spacer(),
          prayTime
        ],
      ),
    );
  }
}

class TextTime extends StatelessWidget {
  const TextTime({
    Key? key,
    required this.prayTime,
  }) : super(key: key);

  final String? prayTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        prayTime!,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
