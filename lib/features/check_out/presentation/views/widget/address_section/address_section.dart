import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class AddressSection extends StatelessWidget {
  AddressSection({super.key});
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          Gap(16),
          CustomTextFormField(
            hintText: "الاسم الكامل",
            keyboardType: TextInputType.name,
            controller: fullNameController,
          ),
          Gap(8),
          CustomTextFormField(
            hintText: "البريد الإلكتروني",
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
          ),
          Gap(8),
          CustomTextFormField(
            hintText: "العنوان",
            keyboardType: TextInputType.text,
            controller: addressController,
          ),
          Gap(8),
          CustomTextFormField(
            hintText: "المدينه",
            keyboardType: TextInputType.text,
            controller: cityNameController,
          ),
          Gap(8),
          CustomTextFormField(
            hintText: "رقم الطابق , رقم الشقه ..",
            keyboardType: TextInputType.text,
            controller: phoneController,
          ),
          Gap(16),
          Row(
            children: [],
          )
        ],
      ),
    );
  }
}
