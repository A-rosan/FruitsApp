import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "الأكثر مبيعًا",
            style: AppTextStyle.bold16,
          ),
        ],
      ),
    );
  }
}
