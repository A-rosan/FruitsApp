import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppTextStyle.semiBold16.copyWith(color: Colors.red),
      ),
    );
  }
}
