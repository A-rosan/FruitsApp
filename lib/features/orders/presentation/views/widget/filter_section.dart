import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_text_style.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.filter_none_outlined,
            size: 20,
          ),
          Gap(10),
          Text(
            "فلتر",
            style: AppTextStyle.bold19,
          ),
        ],
      ),
    );
  }
}
