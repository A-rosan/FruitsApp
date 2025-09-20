import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/cubit/login_cubit.dart';
import 'package:fruits_app/features/auth/cubit/login_states.dart';
import 'package:gap/gap.dart';
// import 'package:fruits_app/core/utils/app_text_style.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/widgets/custom_pass_field.dart';
import '../../../../../core/widgets/custom_social_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/or_divider.dart';

class LoginBody extends StatefulWidget {
  LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Scaffold(
      appBar: appBarBuild(context, title: "تسجيل الدخول"),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: hrAppPadding, vertical: vrAppPadding),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextFormField(
                    controller: emailController,
                    onSaved: (value) => emailController.text = value!,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "البريد الإلكتروني",
                  ),
                  Gap(16),
                  CustomPassField(
                    passwordController: passwordController,
                    onSaved: (value) => passwordController.text = value!,
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
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        cubit.signIn(
                            emailController.text, passwordController.text);
                        // Navigator.pushNamed(context, "home");
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
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
                    onTap: () {
                      cubit.signInWithGoogle();
                      Navigator.pushNamed(context, "home");
                    },
                    buttonText: "تسجيل بواسطة جوجل",
                    socialIcon: "assets/images/googleIcon.svg",
                  ),
                  Gap(16),
                  Platform.isIOS
                      ? Column(
                          children: [
                            CustomSocialButton(
                              onTap: () {
                                cubit.signInWithApple();
                              },
                              buttonText: "تسجيل بواسطة أبل",
                              socialIcon: "assets/images/appleIconsSvg.svg",
                            ),
                            Gap(16),
                          ],
                        )
                      : Gap(0),
                  CustomSocialButton(
                    onTap: () {
                      cubit.signInWithFacebook();
                    },
                    buttonText: "تسجيل بواسطة فيسبوك",
                    socialIcon: "assets/images/facebookIcon.svg",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
