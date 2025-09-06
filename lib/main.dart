import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_functions/on_generate_route.dart';
import 'package:fruits_app/features/splash/presentation/views/spalsh_screen.dart';

void main() {
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.rountName,
    );
  }
}
