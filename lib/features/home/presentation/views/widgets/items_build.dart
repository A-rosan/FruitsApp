import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

class ItemsBuildWidget extends StatelessWidget {
  const ItemsBuildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163,
      // height: 214,
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Icon(
              Icons.favorite_border_rounded,
              color: AppColors.favColor,
              size: 20,
            ),
            // Gap(2),
            Positioned(
              top: -48,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/watermelon.png',
                // height: 114,
                // width: 105,
                fit: BoxFit.contain,
              ),
            ),

            Positioned(
              bottom: 0,
              // top: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "فراولة",
                    style: AppTextStyle.semiBold13,
                  ),
                  Gap(4),
                  Row(
                    children: [
                      Text(
                        "30جنية / ",
                        style: AppTextStyle.bold13
                            .copyWith(color: AppColors.secondaryColor),
                      ),
                      Text(
                        "الكيلو",
                        style: AppTextStyle.bold13
                            .copyWith(color: AppColors.lightSecondaryColor),
                      ),
                      Gap(31),
                      Icon(
                        Icons.add_circle_outlined,
                        size: 40,
                        color: AppColors.primaryColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
