import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/helper_functions/get_user_data.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/images/profile_png.png"),
      title: Text(
        "صباح الخير !..",
        style: AppTextStyle.reg16.copyWith(color: AppColors.greyText),
      ),
      subtitle: Text(
        getUserData().name,
        style: AppTextStyle.bold16,
      ),
      trailing: Container(
        // padding: EdgeInsets.all(12),
        decoration: ShapeDecoration(
          shape: OvalBorder(),
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.circleAvatarColor,
          radius: 20,
          child: SvgPicture.asset(
            "assets/images/noti_pic.svg",
          ),
        ),
      ),
    );
  }
}
