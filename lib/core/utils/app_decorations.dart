import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utils/app_colors.dart';

abstract class AppDecorations {
  static var greyDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(4),
    color: AppColors.containerColor,
    border: Border.all(
      color: AppColors.containerColor,
      width: 2,
    ),
  );
}
