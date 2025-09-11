import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

import '../../features/auth/cubit/states.dart';

void customSnackBar(BuildContext context, SignUpFailuer state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        state.errorMsg,
        style: AppTextStyle.bold13.copyWith(color: Colors.red),
      ),
    ),
  );
}
