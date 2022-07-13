import 'package:flutter/material.dart';
import 'package:musilm_app/config/routes/route.dart';
import 'package:musilm_app/core/utils/color_manager.dart';
import 'package:musilm_app/core/wigdets/text_button.dart';
import 'package:musilm_app/features/onboarding/domain/entities/onboarding.dart';
import 'package:musilm_app/features/onboarding/presentation/widgets/onboarding_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late var bordingContrller = PageController();

  bool isLast = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: bordingContrller,
                  onPageChanged: (index) {
                    if (index == onboardingContents.length - 1) {
                      setState(() {
                        currentIndex = index;
                        isLast = true;
                      });
                    } else {
                      isLast = false;
                    }
                  },
                  itemCount: onboardingContents.length,
                  itemBuilder: (context, index) =>
                      onboardingBuild(onboardingContents[index]),
                ),
              ),
              SmoothPageIndicator(
                controller: bordingContrller,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  spacing: 5.0,
                  expansionFactor: 4,
                  activeDotColor: ColorManager.green,
                ),
                count: onboardingContents.length,
              ),
              const SizedBox(
                height: 20,
              ),
              isLast != true
                  ? Column(
                      children: [
                        DefualtTextButton(
                          ontap: () {
                            setState(() {
                              currentIndex -= 1;
                              bordingContrller.previousPage(
                                duration: const Duration(
                                  microseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            });
                          },
                          buttonText: 'رجوع',
                          borderColor: ColorManager.lightSky,
                          textColor: ColorManager.lightSky,
                          backgroundColor: ColorManager.offWhite,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefualtTextButton(
                          ontap: () {
                            setState(() {
                              currentIndex += 1;
                              bordingContrller.nextPage(
                                duration: const Duration(
                                  microseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            });
                          },
                          buttonText: 'التالي',
                          borderColor: ColorManager.lightSky,
                          textColor: ColorManager.lightSky,
                          backgroundColor: ColorManager.offWhite,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        //todo for later use
                        // defaulTextFeild(
                        //   label: 'Enter your country..',
                        //   suffix: Icons.add_location,
                        //   prefix: Icons.search,
                        // ),
                        DefualtTextButton(
                          ontap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.bottomNavigation, (route) => false);
                          },
                          buttonText: 'لنبدآ',
                          borderColor: ColorManager.green,
                          textColor: ColorManager.offWhite,
                          backgroundColor: ColorManager.green,
                        ),
                      ],
                    ),
              //  BottomSheet: if (currentIndex != onboardingContents.length -1)
            ],
          ),
        ),
      ),
      // bottomSheet:
    );
  }
}
