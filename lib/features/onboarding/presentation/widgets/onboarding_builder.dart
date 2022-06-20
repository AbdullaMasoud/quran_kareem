import 'package:flutter/material.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/features/onboarding/domain/entities/onboarding.dart';

Widget onboardingBuild(OnBoardingModle modle) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(modle.image),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          modle.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            height: 1.5,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          modle.paraText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: ColorManager.lightSky,
            height: 1.4,
          ),
        ),
      ],
    );
