import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:gap/gap.dart';
// import 'package:fruits_app/core/utils/app_text_style.dart';

import '../../../../../core/helper_functions/custom_app_bar.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/widgets/custom_social_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/or_divider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(context, title: "تسجيل الدخول"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: hrAppPadding, vertical: vrAppPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "البريد الإلكتروني",
              ),
              Gap(16),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                hintText: "كلمة المرور",
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              Gap(16),
              GestureDetector(
                onTap: () {
                  //navigate to forget pass screen
                },
                child: Text(
                  "نسيت كلمة المرور؟",
                  style: AppTextStyle.semiBold13
                      .copyWith(color: AppColors.lightPrimary),
                ),
              ),
              Gap(33),
              CustomButton(
                buttonText: "تسجيل دخول",
                onPressed: () {
                  //navigate to home screen
                },
              ),
              Gap(33),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لا تمتلك حساب؟",
                    style: AppTextStyle.semiBold16
                        .copyWith(color: AppColors.greyText),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "signUp");
                    },
                    child: Text(
                      "قم بأنشاء حساب",
                      style: AppTextStyle.semiBold16
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              Gap(16),
              OrDivider(),
              Gap(31),
              CustomSocialButton(
                onTap: () {},
                buttonText: "تسجيل بواسطة جوجل",
                socialIcon: "assets/images/googleIcon.svg",
              ),
              Gap(16),
              CustomSocialButton(
                onTap: () {},
                buttonText: "تسجيل بواسطة أبل",
                socialIcon: "assets/images/appleIconsSvg.svg",
              ),
              Gap(16),
              CustomSocialButton(
                onTap: () {},
                buttonText: "تسجيل بواسطة فيسبوك",
                socialIcon: "assets/images/facebookIcon.svg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
