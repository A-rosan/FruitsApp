import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_constant.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

AppBar appBarBuild(context, {required String title, bool isHome = false}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.bold19,
    ),
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios_new,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    actions: [
      isHome
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: hrAppPadding),
              child: CircleAvatar(
                backgroundColor: AppColors.circleAvatarColor,
                radius: 20,
                child: SvgPicture.asset(
                  "assets/images/noti_pic.svg",
                ),
              ),
            )
          : SizedBox.shrink(),
    ],
  );
}
