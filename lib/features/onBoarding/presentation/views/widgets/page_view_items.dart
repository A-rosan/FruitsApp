// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/service/shared_pref_singlton.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/auth/presentation/views/login_screen.dart';
// import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:gap/gap.dart';

// import '../../../../../core/widgets/custom_button.dart';

class PageViewItems extends StatelessWidget {
  const PageViewItems({
    super.key,
    required this.image,
    required this.backGroundImage,
    required this.subTitle,
    required this.title,
    required this.isVisivle,
  });
  final String image, backGroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisivle;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backGroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                  // fit: BoxFit.fill,
                ),
              ),
              SafeArea(
                child: Visibility(
                  visible: isVisivle,
                  child: TextButton(
                    child: Text(
                      "تخط",
                      style: AppTextStyle.regular13
                          .copyWith(color: AppColors.grey),
                    ),
                    onPressed: () {
                      Prefs.setBool(isOnboardingSeen, true);
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routName);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Gap(60),
        title,
        Gap(20),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Text(subTitle,
              textAlign: TextAlign.center, style: AppTextStyle.semiBold13),
        ),

        // Gap(64),
      ],
    );
  }
}
