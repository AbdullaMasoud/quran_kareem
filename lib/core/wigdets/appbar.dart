import 'package:flutter/material.dart';

import 'package:musilm_app/core/utils/assets_manager.dart';

class AppBarImageBackGround extends StatelessWidget {
  final double hieght;
  const AppBarImageBackGround({
    Key? key,
    required this.hieght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        image: DecorationImage(
          image: AssetImage(AssetsManager.appbarBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
