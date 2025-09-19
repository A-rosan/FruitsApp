import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    super.key,
    required this.assetName,
    required this.title,
  });
  final String assetName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      height: 30,
      decoration: ShapeDecoration(
        color: AppColors.containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            // height: 30,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(child: SvgPicture.asset(assetName)),
          ),
          Gap(4),
          Text(
            title,
            style:
                AppTextStyle.semiBold11.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
