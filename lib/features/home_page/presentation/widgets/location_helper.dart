import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetUserLocation {
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        const SnackBar(content: Text('Location permissions are denied'));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'));
      return false;
    }
    return true;
  }

  static Future<Position> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) {
      await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<String> getAddressFromLatLng(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
      localeIdentifier: 'ar',
    );

    String place;
    if (placemarks[0].locality!.isEmpty) {
      place = '${placemarks[0].country} - ${placemarks[0].subLocality}';
    } else {
      place = '${placemarks[0].country} - ${placemarks[0].locality}';
    }
    print(placemarks[0].locality);

    return place;
  }
}
