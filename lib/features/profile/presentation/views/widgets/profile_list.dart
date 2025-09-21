import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class ProfileListBuild extends StatelessWidget {
  ProfileListBuild({
    super.key,
    required this.firstIcon,
    // required this.lastIcon,
    required this.title,
    this.onTap,
  });

  final IconData firstIcon;
  // final IconData lastIcon;
  final String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            //navigate to respective screens
            onTap!();
          },
          child: Row(
            children: [
              Icon(
                firstIcon,
                color: AppColors.primaryColor,
              ),
              Gap(8),
              Text(
                title,
                style: AppTextStyle.semiBold13
                    .copyWith(color: AppColors.textProfileColor),
              ),
              const Spacer(),
              // Text(
              //   "العربية",
              //   style: AppTextStyle.semiBold13
              //       .copyWith(color: AppColors.textProfileColor),
              // ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.favColor,
              )
            ],
          ),
        ),
        Divider(color: AppColors.dividerColor),
        Gap(4),
      ],
    );
  }
}
