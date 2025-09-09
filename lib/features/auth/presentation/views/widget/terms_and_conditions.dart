import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(14, 0),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - (hrAppPadding * 2) - 48,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "من خلال إنشاء حساب ، فإنك توافق على ",
                    style: AppTextStyle.semiBold13.copyWith(
                      color: AppColors.greyText,
                    ),
                  ),
                  TextSpan(
                    text: "الشروط والأحكام الخاصة بنا",
                    style: AppTextStyle.semiBold13.copyWith(
                      color: AppColors.lightPrimary,
                    ),
                  ),
                  TextSpan(
                    text: "الخاصة بنا",
                    style: AppTextStyle.semiBold13.copyWith(
                      color: AppColors.lightPrimary,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

              // Text(
              //   " من خلال إنشاء حساب ، فإنك توافق على",
              //   style: AppTextStyle.semiBold13.copyWith(
              //     color: AppColors.greyText,
              //   ),
              // ),
              // Text(
              //   "لشروط والأحكام الخاصة بنا",
              //   style: AppTextStyle.semiBold13
              //       .copyWith(color: AppColors.lightPrimary),
              // ),