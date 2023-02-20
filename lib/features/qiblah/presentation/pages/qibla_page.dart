import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:musilm_app/core/utils/assets_manager.dart';
import 'package:musilm_app/features/qiblah/presentation/widgets/qibla_compass.dart';

class QiblaPage extends StatefulWidget {
  const QiblaPage({Key? key}) : super(key: key);

  @override
  State<QiblaPage> createState() => _QiblaPageState();
}

class _QiblaPageState extends State<QiblaPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.qiblaBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              QiblahCompass(),
              // FutureBuilder(
              //   future: _deviceSupport,
              //   builder: (_, AsyncSnapshot<bool?> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const LoadingAnimation();
              //     }
              //     if (snapshot.hasError) {
              //       return Center(
              //         child: Text("Error: ${snapshot.error.toString()}"),
              //       );
              //     }

              //     if (snapshot.data!) {
              //       return QiblahCompass();
              //     } else {
              //       return QiblahCompass();
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
