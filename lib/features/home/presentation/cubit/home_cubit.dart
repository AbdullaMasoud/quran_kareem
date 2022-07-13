import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:musilm_app/core/error/failures.dart';
import 'package:musilm_app/core/utils/const_manager.dart';
import 'package:musilm_app/features/home/domain/entities/pray_time.dart';
import 'package:musilm_app/features/home/domain/usecases/get_today_pray_time.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSpecificPrayTime getSpecificPrayTime;
  HomeCubit({
    required this.getSpecificPrayTime,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getSpecificPrayTimes() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String formatedDate = dateFormate(selectedDay);

    Either<Failure, Data> response = await getSpecificPrayTime(
        SpecificPrayTimeParams(address: position, date: formatedDate));
    emit(response.fold(
        (failure) => PrayTimeErrorState(msg: _mapFailureToMsg(failure)),
        (praytime) => PrayTimeLoadedState(prayTime: praytime)));

    // getLocationFromLatLong();
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

  // late Position position;
  // getlocation() async {
  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();

  //   position = await Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.high)
  //       .then((value) {
  //     getSpecificPrayTimes(value);
  //     getLocationFromLatLong(value);
  //     return position;
  //   });
  // }

  // convert lat and long of location into address

  // calendar
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  void changeDaySelected(DateTime selectedDate, DateTime foucusDate) {
    selectedDay = selectedDate;
    focusedDay = foucusDate;
    dateFormate(selectedDate);
    getSpecificPrayTimes();
    emit(Emittest());
  }

  String dateFormate(DateTime date) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
