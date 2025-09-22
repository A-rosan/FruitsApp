import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_text_style.dart';
import '../../../../../../../core/widgets/custom_check_box.dart';

class IsFeatureProduct extends StatefulWidget {
  const IsFeatureProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<IsFeatureProduct> createState() => _IsFeatureProductState();
}

class _IsFeatureProductState extends State<IsFeatureProduct> {
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
                  text: "اضافة المنتج كمنتج مميز",
                  style: AppTextStyle.semiBold13.copyWith(
                    color: AppColors.greyText,
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
