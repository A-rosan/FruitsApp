import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

// import '../../features/auth/cubit/sign_up_states.dart';

void customSnackBar(BuildContext context, state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green.shade50,
      duration: Duration(milliseconds: 1000),
      behavior: SnackBarBehavior.floating,
      content: Text(
        state.errorMsg,
        style: AppTextStyle.bold13.copyWith(color: Colors.red),
      ),
    ),
  );
}

void customSuccessBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green.shade50,
      duration: Duration(milliseconds: 1000),
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: AppTextStyle.bold13.copyWith(color: Colors.green),
      ),
    ),
  );
}

void showCustomErrorSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green.shade50,
      duration: Duration(milliseconds: 1000),
      behavior: SnackBarBehavior.floating,
      content: Text(
        msg,
        style: AppTextStyle.bold13.copyWith(color: Colors.red),
      ),
    ),
  );
}
