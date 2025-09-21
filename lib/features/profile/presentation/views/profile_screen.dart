import 'package:flutter/material.dart';
import 'package:fruits_app/core/helper_functions/get_user_data.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:gap/gap.dart';

import 'widgets/profile_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const routName = "profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "حسابي",
          style: AppTextStyle.bold19,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Stack(
                  // alignment: Alignment.bottomLeft,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage('assets/images/profile_png.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      // right: 0,

                      child: GestureDetector(
                        onTap: () {
                          //pick image from gallery
                        },
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 27,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                Gap(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getUserData().name,
                      style: AppTextStyle.bold13,
                    ),
                    Gap(2),
                    Text(
                      getUserData().email,
                      style: AppTextStyle.reg11
                          .copyWith(color: AppColors.textProfileColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "عام",
              style: AppTextStyle.semiBold13,
            ),
          ),
          // Gap(20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileListBuild(
                  firstIcon: Icons.person_outline_outlined,
                  title: "الملف الشخصي",
                ),
                ProfileListBuild(
                  firstIcon: Icons.check_box_outline_blank_outlined,
                  title: "طلباتي",
                ),
                ProfileListBuild(
                  firstIcon: Icons.wallet_outlined,
                  title: "المدفوعات",
                ),
                ProfileListBuild(
                  firstIcon: Icons.favorite_border,
                  title: "المفضلة",
                ),
                //todo change last icon
                ProfileListBuild(
                  firstIcon: Icons.notifications_none,
                  title: "الإشعارات",
                ),
                ProfileListBuild(
                  firstIcon: Icons.language,
                  title: "اللغة",
                ),
                ProfileListBuild(
                  firstIcon: Icons.mode_edit_outline_outlined,
                  title: "الوضع",
                ),
                ProfileListBuild(
                  firstIcon: Icons.dashboard_customize,
                  title: "مالك التطبيق",
                  onTap: () {
                    Navigator.pushNamed(context, 'dashBoard');
                  },
                ),
                Gap(20),
                Text(
                  "المساعدة",
                  style: AppTextStyle.semiBold13,
                ),
                Gap(16),

                ProfileListBuild(
                  firstIcon: Icons.info_outline,
                  title: "من نحن",
                ),
              ],
            ),
          ),
          Gap(20),
          GestureDetector(
            onTap: () {
              //sign out function
            },
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: ShapeDecoration(
                color: AppColors.logOutColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تسجيل الخروج",
                    style: AppTextStyle.semiBold16
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Gap(80),
                  Transform.flip(
                    flipX: true,
                    child: const Icon(
                      Icons.logout,
                      color: AppColors.lightPrimary,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
