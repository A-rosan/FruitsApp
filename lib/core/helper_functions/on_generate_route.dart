import 'package:flutter/material.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/onBoarding_screen.dart';
import 'package:fruits_app/features/splash/presentation/views/spalsh_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.rountName:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case OnboardingScreen.rouName:
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
