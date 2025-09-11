import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
// import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_check_box.dart';
// import 'package:gap/gap.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
    required this.onChecked,
  });
  final ValueChanged<bool> onChecked;

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        Gap(16),
        Expanded(
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
    );
  }
}
