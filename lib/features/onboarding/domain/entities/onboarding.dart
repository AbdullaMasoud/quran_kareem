class OnBoardingModle {
  late final String title;
  late final String paraText;
  late final String image;
  OnBoardingModle({
    required this.title,
    required this.paraText,
    required this.image,
  });
}

List<OnBoardingModle> onboardingContents = [
  OnBoardingModle(
    title: 'A new way to\n manage our worship',
    paraText: 'We can help you manage your\n  worship list on time1',
    image: 'assets/images/onboarding_1.png',
  ),
  OnBoardingModle(
    title: 'A new wey to\n  manage our worship',
    paraText: 'We can help you manage your\n worship list on time2',
    image: 'assets/images/onboarding_1.png',
  ),
  OnBoardingModle(
    title: 'A new wey to\n  manage our worship',
    paraText: 'We can help you manage your\n  worship list on time3',
    image: 'assets/images/onboarding_1.png',
  ),
];
