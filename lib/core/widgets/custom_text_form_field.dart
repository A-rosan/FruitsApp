import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

import 'custom_out_line_border.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.controller,
    this.suffixIcon,
    this.onSaved,
    this.isPass = false,
    this.maxLines,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  TextEditingController? controller;
  final bool isPass;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      obscureText: isPass,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
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
