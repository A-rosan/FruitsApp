import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'terms_and_conditions.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hrAppPadding,
        vertical: vrAppPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              keyboardType: TextInputType.name,
              hintText: "الاسم كامل",
            ),
            Gap(16),
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
            TermsAndConditions(),
            Gap(30),
            CustomButton(
              onPressed: () {
                //creat new account
              },
              buttonText: "إنشاء حساب جديد",
            ),
            Gap(26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "تمتلك حساب بالفعل؟",
                  style: AppTextStyle.semiBold16
                      .copyWith(color: AppColors.greyText),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "login");
                  },
                  child: Text(
                    "تسجيل الدخول",
                    style: AppTextStyle.semiBold16
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
