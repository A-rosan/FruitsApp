import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_text_style.dart';
import '../../../../../../../core/widgets/custom_check_box.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isOrganic = value;
            widget.onChecked(value);
            setState(() {});
          },
          isChecked: isOrganic,
        ),
        Gap(16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "اضافة المنتج كمنتج اورجانيك",
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
    ;
  }
}
