import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/cubit/cubit.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_pass_field.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../cubit/states.dart';
import 'terms_and_conditions.dart';

class SignUpBody extends StatefulWidget {
  SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = SignUpCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hrAppPadding,
        vertical: vrAppPadding,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value) => nameController.text = value!,
                controller: nameController,
                keyboardType: TextInputType.name,
                hintText: "الاسم كامل",
              ),
              Gap(16),
              CustomTextFormField(
                onSaved: (value) => emailController.text = value!,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: "البريد الإلكتروني",
              ),
              Gap(16),
              CustomPassField(
                passwordController: passwordController,
                onSaved: (value) => passwordController.text = value!,
              ),
              Gap(16),
              TermsAndConditions(
                onChecked: (value) {
                  isChecked = value;
                },
              ),
              Gap(30),
              CustomButton(
                onPressed: () {
                  //creat new account
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isChecked) {
                      cubit.createUserWithEmailAndPassword(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                      );
                    } else {
                      customSnackBar(
                        context,
                        SignUpFailuer(
                            errorMsg: " يجب الموافقة على الشروط والأحكام"),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
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
                      Navigator.pop(context);
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
      ),
    );
  }
}
