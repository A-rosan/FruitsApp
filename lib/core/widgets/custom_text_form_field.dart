import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

import '../helper_functions/custom_out_line_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppTextStyle.bold13.copyWith(color: AppColors.grey),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: borderBuild(),
        enabledBorder: borderBuild(),
        focusedBorder: borderBuild(),
      ),
    );
  }
}
