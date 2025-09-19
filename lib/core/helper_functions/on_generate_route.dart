import 'package:flutter/material.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/onBoarding_screen.dart';
import 'package:fruits_app/features/splash/presentation/views/spalsh_screen.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/sign_up_screen.dart';
import '../../features/best_selling/presentation/views/best_selling_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.rountName:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case OnboardingScreen.routName:
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    case LoginScreen.routName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case SignUpScreen.routName:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case BestSellingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingScreen());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
