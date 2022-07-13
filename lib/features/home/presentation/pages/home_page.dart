import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musilm_app/features/home/presentation/cubit/cubit/test_cubit.dart';
import 'package:musilm_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:musilm_app/features/home/presentation/widgets/calendar_builder.dart';
import 'package:musilm_app/features/home/presentation/widgets/date_builder.dart';
import 'package:musilm_app/features/home/presentation/widgets/location_builder.dart';
import 'package:musilm_app/features/home/presentation/widgets/pray_time_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getTodayPrayTime() async {
    await BlocProvider.of<HomeCubit>(context)
        .getSpecificPrayTimes()
        .then((value) {
      BlocProvider.of<TestCubit>(context).getLocationFromLatLong();
    });
  }

  @override
  void initState() {
    super.initState();
    _getTodayPrayTime();
  }

  Widget _prayTimeBlocBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is PrayTimeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PrayTimeErrorState) {
          return Center(child: Text(state.msg));
        } else if (state is PrayTimeLoadedState) {
          return PrayTimeBuilder(prayTime: state.prayTime.prayTime);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _dateTimeBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is PrayTimeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PrayTimeErrorState) {
          return Center(child: Text(state.msg));
        } else if (state is PrayTimeLoadedState) {
          return DateBuilder(date: state.prayTime.prayTime.date);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _locationBuilder() {
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        if (state is Emittest1) {
          return const LocationBuilder();
        } else {
          return const LocationBuilder();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // var homeCubit = HomeCubit.get(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                right: 15.0,
              ),
              child: Column(
                children: [
                  _dateTimeBuilder(),
                  _locationBuilder(),
                ],
              ),
            ),
            const CalendarBuilder(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _prayTimeBlocBuilder(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
