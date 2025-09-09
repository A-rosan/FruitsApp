import 'package:flutter/material.dart';

import '../../../../core/helper_functions/custom_app_bar.dart';
import 'widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routName = "signUp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: "حساب جديد",
      ),
      body: SignUpBody(),
    );
  }
}
