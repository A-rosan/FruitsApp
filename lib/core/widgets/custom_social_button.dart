import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

// import '../helper_functions/custom_out_line_border.dart';

// import '../utils/app_colors.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    this.onTap,
    this.buttonText,
    this.width,
    this.height,
    this.socialIcon,
  });
  final GestureTapCallback? onTap;
  final String? buttonText;
  final double? width;
  final double? height;
  final String? socialIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.grey,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 19,
          ),
          child: Row(
            children: [
              SvgPicture.asset(socialIcon ?? ""),
              Gap(53),
              Text(
                buttonText ?? "",
                style: AppTextStyle.semiBold16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
