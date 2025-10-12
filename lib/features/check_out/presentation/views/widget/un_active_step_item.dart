import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class UnActiveStepItem extends StatelessWidget {
  const UnActiveStepItem({super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.containerColor,
            child: Text(
              index.toString(),
              style: AppTextStyle.semiBold13,
            )),
        Gap(6),
        Text(
          title,
          style: AppTextStyle.semiBold13.copyWith(color: AppColors.greyText),
        ),
      ],
    );
  }
}
