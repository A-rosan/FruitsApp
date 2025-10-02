import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_text_style.dart';

class CartWidgetBuild extends StatelessWidget {
  const CartWidgetBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: hrAppPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 92,
            width: 73,
            decoration: BoxDecoration(color: AppColors.containerColor),
            child: Image.asset(
              "assets/images/watermelon.png",
              fit: BoxFit.contain,
            ),
          ),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "بطيخ",
                      style: AppTextStyle.bold13,
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: AppColors.greyIcon,
                    ),
                  ],
                ),
                Gap(4),
                Text(
                  "3 كم",
                  style: AppTextStyle.regular13
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Gap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                            child:
                                Icon(Icons.add, size: 18, color: Colors.white),
                          ),
                        ),
                        Gap(12),
                        Text("3", style: AppTextStyle.bold13),
                        Gap(12),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.containerColor,
                            ),
                            child: Icon(Icons.remove,
                                size: 18, color: AppColors.grey),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "60 جنيه",
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
                Gap(10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
