import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/utils/assets_manager.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/features/home_page/domain/entities/pray_time.dart';
import 'package:musilm_app/features/home_page/domain/usecases/get_today_pray_time.dart';
import 'package:musilm_app/features/home_page/presentation/cubit/home_page_state.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/location_helper.dart';
import 'package:musilm_app/features/home_page/presentation/widgets/time_format.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final GetSpecificPrayTime getSpecificPrayTime;
  HomePageCubit({
    required this.getSpecificPrayTime,
  }) : super(HomeInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  Future<void> getSpecificPrayTimes() async {
    // await Geolocator.checkPermission();
    // await Geolocator.requestPermission();
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);

    Position userLocation = await GetUserLocation.getCurrentPosition();
    String formatedDate = dateFormate(dateTime);

    Either<Failure, Data> response = await getSpecificPrayTime(
        SpecificPrayTimeParams(address: userLocation, date: formatedDate));
    emit(response.fold(
        (failure) => PrayTimeErrorState(msg: _mapFailureToMsg(failure)),
        (praytime) => PrayTimeLoadedState(prayTime: praytime)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return ConstentManager.serverFailure;
      case CacheFailure:
        return ConstentManager.cacheFailure;
      default:
        return ConstentManager.unexpectedError;
    }
  }

  // convert lat and long of location into address

  // calendar
  DateTime dateTime = DateTime.now();

  String dateFormate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  Map<String, String> sliderPray = {
    ConstentManager.fajar: AssetsManager.fajarSlider,
    ConstentManager.sunrise: AssetsManager.sunriseSlider,
    ConstentManager.duhr: AssetsManager.duhrSlider,
    ConstentManager.asr: AssetsManager.asrSlider,
    ConstentManager.maghrib: AssetsManager.mughibSlider,
    ConstentManager.isha: AssetsManager.ishaSlider,
    ConstentManager.imsak: AssetsManager.imsakSlider,
  };

  Map<String, String> prayImage = {
    ConstentManager.fajar: AssetsManager.fajar,
    ConstentManager.sunrise: AssetsManager.sunrise,
    ConstentManager.duhr: AssetsManager.zuhr,
    ConstentManager.asr: AssetsManager.aser,
    ConstentManager.maghrib: AssetsManager.maghrib,
    ConstentManager.isha: AssetsManager.isha,
    ConstentManager.imsak: AssetsManager.imsak,
  };

  String getNameForTime(
      PrayTime time, Map<String, String> pray, bool returnKeys) {
    // Get the current time.
    DateTime now = DateTime.now();
    String currentDate = "${now.year}-${now.month}-${now.day}";

    // Parse the time from the Time object into DateTime objects.
    DateTime fajar = TimeFormat.parseTime('$currentDate ${time.times.fajr}');
    DateTime sunrise =
        TimeFormat.parseTime('$currentDate ${time.times.sunrise}');
    DateTime dhuhr = TimeFormat.parseTime('$currentDate ${time.times.dhuhr}');
    DateTime asr = TimeFormat.parseTime('$currentDate ${time.times.asr}');
    DateTime maghrib =
        TimeFormat.parseTime('$currentDate ${time.times.maghrib}');
    DateTime isha = TimeFormat.parseTime('$currentDate ${time.times.isha}');
    DateTime imsak = TimeFormat.parseTime('$currentDate ${time.times.imsak}');

    // Check if the current time is before the pray time.
    if (now.isBefore(fajar)) {
      return returnKeys ? pray.keys.elementAt(6) : pray.values.elementAt(6);
    }

    if (now.isBefore(sunrise)) {
      return returnKeys ? pray.keys.elementAt(0) : pray.values.elementAt(0);
    }

    if (now.isBefore(dhuhr)) {
      return returnKeys ? pray.keys.elementAt(1) : pray.values.elementAt(1);
    }

    if (now.isBefore(asr)) {
      return returnKeys ? pray.keys.elementAt(2) : pray.values.elementAt(2);
    }

    if (now.isBefore(maghrib)) {
      return returnKeys ? pray.keys.elementAt(3) : pray.values.elementAt(3);
    }

    if (now.isBefore(isha)) {
      return returnKeys ? pray.keys.elementAt(4) : pray.values.elementAt(4);
    }

    if (now.isBefore(imsak)) {
      return returnKeys ? pray.keys.elementAt(5) : pray.values.elementAt(5);
    }

    // If the current time is after all of the times, return the default name.
    return returnKeys ? pray.keys.elementAt(6) : pray.values.elementAt(6);
  }
}
