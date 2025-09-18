import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';

class FeatureButton extends StatelessWidget {
  const FeatureButton({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(116, 32),
        backgroundColor: Colors.white, // button background
        foregroundColor: AppColors.primaryColor, // text color
        elevation: 0, // no shadow
        // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // rounded corners
          // green border
        ),
      ),
      child: Text(
        "تسوق الان",
        style: AppTextStyle.bold13.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
