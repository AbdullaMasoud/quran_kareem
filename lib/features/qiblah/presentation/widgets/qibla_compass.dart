import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:musilm_app/core/utils/assets_manager.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              // case LocationPermission.denied:
              //   return LocationErrorWidget(
              //     error: "Location service permission denied",
              //     callback: _checkLocationStatus,
              //   );
              // case LocationPermission.deniedForever:
              //   return LocationErrorWidget(
              //     error: "Location service Denied Forever !",
              //     callback: _checkLocationStatus,
              //   );
              // case GeolocationStatus.unknown:
              //   return LocationErrorWidget(
              //     error: "Unknown Location service error",
              //     callback: _checkLocationStatus,
              //   );
              default:
                return const SizedBox();
            }
          } else {
            return const CircularProgressIndicator();
            // return LocationErrorWidget(
            //   error: "Please enable Location service",
            //   callback: _checkLocationStatus,
            // );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else {
      _locationStreamController.sink.add(locationStatus);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatefulWidget {
  @override
  State<QiblahCompassWidget> createState() => _QiblahCompassWidgetState();
}

class _QiblahCompassWidgetState extends State<QiblahCompassWidget>
    with SingleTickerProviderStateMixin {
  final _compassSvg = SvgPicture.asset(AssetsManager.compassImage);

  final _needleSvg = SvgPicture.asset(
    AssetsManager.compassHandleImage,
    fit: BoxFit.contain,
    height: 150,
    alignment: Alignment.center,
  );

  late AnimationController aa;

  @override
  void initState() {
    super.initState();
    aa = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    aa.forward();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final qiblahDirection = snapshot.data!;

        CurvedAnimation ss = CurvedAnimation(
          parent: aa,
          curve: Curves.easeInOut,
        );

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedRotation(
              turns: (qiblahDirection.qiblah / 360 * -1 * pi),
              duration: const Duration(seconds: 1),
              child: _compassSvg,
            ),
            _needleSvg,
            Positioned(
              bottom: 8,
              child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°"),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    aa.dispose();
    super.dispose();
  }
}
