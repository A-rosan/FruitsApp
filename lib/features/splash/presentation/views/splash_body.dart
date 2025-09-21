import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/service/firebase_auth_service.dart';
import 'package:fruits_app/core/service/shared_pref_singlton.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/features/auth/presentation/views/login_screen.dart';
import 'package:fruits_app/features/home/presentation/views/main_screen.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/onBoarding_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset("assets/images/splash_tree.svg"),
          ],
        ),
        SvgPicture.asset("assets/images/splash_logo.svg"),
        // Text("akjsbhdkjasbhdhasbjdhb"),
        SvgPicture.asset(
          "assets/images/bottomLogo.svg",
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      bool onBoardingSeen = Prefs.getBool(isOnboardingSeen);
      if (onBoardingSeen) {
        var isLogedIn = FirebaseAuthService().isLoggedIn();
        if (isLogedIn) {
          Navigator.pushReplacementNamed(context, MainScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen.routName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnboardingScreen.routName);
      }
    });
  }
}
