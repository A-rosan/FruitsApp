import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.height, this.color});
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 1,
      color: color ?? AppColors.dividerColor,
    );
  }
}
