import 'package:flutter/material.dart';

import 'widgets/onBoarding_body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const routName = "onBoarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody(),
    );
  }
}
