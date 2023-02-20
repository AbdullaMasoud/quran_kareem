import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:musilm_app/core/utils/value_manager.dart';
import 'package:musilm_app/core/wigdets/loading_annimation.dart';
import 'package:musilm_app/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:musilm_app/features/home_page/presentation/cubit/home_page_state.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/categories_section.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/hijri_date_builder.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/pray_time_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_manager.dart';
import '../cubit/address_cubit/user_address_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getTodayPrayTime() async {
    await BlocProvider.of<HomePageCubit>(context)
        .getSpecificPrayTimes()
        .then((value) => {
              BlocProvider.of<UserAddressCubit>(context).getUserAddress(),
            });
  }

  @override
  void initState() {
    super.initState();
    _getTodayPrayTime();
    HijriCalendar.setLocal('ar');
  }

  Widget _backGroundImage() {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      var homeCubit = HomePageCubit.get(context);
      if (state is PrayTimeLoadedState) {
        return Container(
          height: 0.43.sh,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage(
                homeCubit.getNameForTime(
                    state.prayTime.prayTime, homeCubit.prayImage, false),
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      } else {
        return Container(
          height: 0.43.sh,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            image: DecorationImage(
              image: AssetImage(AssetsManager.imsak),
              fit: BoxFit.cover,
            ),
          ),
        );
      }
    });
  }

  Widget _changedPrayName() {
    return BlocBuilder<HomePageCubit, HomePageState>(builder: (context, state) {
      var homeCubit = HomePageCubit.get(context);
      if (state is PrayTimeLoadedState) {
        return Text(
            homeCubit.getNameForTime(
                state.prayTime.prayTime, homeCubit.prayImage, true),
            style: Theme.of(context).textTheme.displaySmall);
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            LoadingAnimation(),
          ],
        );
      }
    });
  }

  Widget _loadUserAddress() {
    return BlocBuilder<UserAddressCubit, UserAddressState>(
        builder: (context, state) {
      if (state is UserAdressLoaded) {
        return Text(
          state.userAddress,
          style: Theme.of(context).textTheme.headlineLarge,
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            LoadingAnimation(),
          ],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.50.sh,
            child: Stack(
              children: [
                _backGroundImage(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w20,
                    vertical: AppHieght.h20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مرحبًا بعودتك',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const HijriDateBuilder(),
                      _changedPrayName(),
                      _loadUserAddress(),
                    ],
                  ),
                ),
                Positioned(
                    top: 210.h,
                    bottom: AppHieght.h0,
                    left: AppWidth.w0,
                    right: AppWidth.w0,
                    child: const PrayTimeSliderBuilder()),
              ],
            ),
          ),
          const CategoriesString(),
          SizedBox(
            height: 0.4.sh,
            child: const CategoriesSection(),
          ),
        ],
      ),
    );
  }
}
