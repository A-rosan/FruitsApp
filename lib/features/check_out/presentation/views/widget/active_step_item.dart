import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ),
        Gap(6),
        Text(
          title,
          style: AppTextStyle.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
