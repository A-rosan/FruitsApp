import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_constant.dart';
import '../../../../../../core/utils/app_text_style.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.price,
    required this.cashOnDelivery,
    required this.title,
    required this.supTitle,
    required this.onTap,
  });
  final String title, supTitle, price;
  final bool cashOnDelivery;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          // width: 340,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.containerColor,
            border: Border.all(
              color: cashOnDelivery
                  ? AppColors.primaryColor
                  : AppColors.containerColor,
              width: 2,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: hrAppPadding,
              vertical: vrAppPadding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColors.greyIcon,
                      ),
                    ),
                    color: cashOnDelivery
                        ? AppColors.primaryColor
                        : AppColors.containerColor,
                  ),
                ),
                Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.semiBold16,
                    ),
                    Gap(6),
                    Text(
                      supTitle,
                      style: AppTextStyle.regular13.copyWith(
                        color: AppColors.greyText,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: Text(
                    price,
                    style: AppTextStyle.bold13
                        .copyWith(color: AppColors.lightPrimary),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
