import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import 'costum_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomDivider(),
        ),
        Gap(16),
        Text(
          "أو",
          style: AppTextStyle.semiBold16,
        ),
        Gap(16),
        Expanded(
          child: CustomDivider(),
        ),
      ],
    );
  }
}
