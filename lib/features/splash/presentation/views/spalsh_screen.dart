import 'package:flutter/material.dart';

import 'splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const rountName = "spalsh";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(),
    );
  }
}
