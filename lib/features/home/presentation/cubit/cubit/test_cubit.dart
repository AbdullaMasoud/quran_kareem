import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
  static TestCubit get(context) => BlocProvider.of(context);

  String? country;
  String? locality;
  getLocationFromLatLong() async {
    // emit(LocationLoading());
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> userAddress =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = userAddress[0];
    locality = "${placemark.locality}";
    country = "${placemark.country}";
    emit(Emittest1());
  }
}
