import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/core/helper_functions/on_generate_route.dart';
import 'package:fruits_app/core/service/get_it_service.dart';
import 'package:fruits_app/core/service/shared_pref_singlton.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/features/splash/presentation/views/spalsh_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/service/bloc_observ.dart';
import 'firebase_options.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale("ar"),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routName,
    );
  }
}
