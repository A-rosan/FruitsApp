import 'package:flutter/material.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/onBoarding_screen.dart';
import 'package:fruits_app/features/splash/presentation/views/spalsh_screen.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/sign_up_screen.dart';
import '../../features/best_selling/presentation/views/best_selling_screen.dart';
import '../../features/check_out/presentation/views/check_out.dart';
import '../../features/home/presentation/views/main_screen.dart';
import '../../features/profile/presentation/views/widgets/dash_board/add_data_screen.dart';
import '../../features/profile/presentation/views/widgets/dash_board/widgets/dash_board_body.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routName:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case OnboardingScreen.routName:
      return MaterialPageRoute(builder: (context) => OnboardingScreen());
    case LoginScreen.routName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case SignUpScreen.routName:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case MainScreen.routName:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case BestSellingScreen.routName:
      return MaterialPageRoute(builder: (context) => const BestSellingScreen());
    case AddDataScreen.routName:
      return MaterialPageRoute(builder: (context) => const AddDataScreen());
    case DashBoardBody.routName:
      return MaterialPageRoute(builder: (context) => DashBoardBody());
    case CheckOutScreen.routName:
      return MaterialPageRoute(builder: (context) => CheckOutScreen());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
