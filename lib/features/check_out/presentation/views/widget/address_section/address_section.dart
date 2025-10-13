import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../domain/order_entity.dart';

class AddressSection extends StatefulWidget {
  AddressSection({
    super.key,
    required this.addressSecFormKey,
    required this.valueListenable,
  });
  GlobalKey<FormState> addressSecFormKey = GlobalKey<FormState>();
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection>
    with AutomaticKeepAliveClientMixin {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = context.read<OrderEntity>();
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: widget.valueListenable,
      builder: (context, value, child) => Form(
        key: widget.addressSecFormKey,
        autovalidateMode: value,
        child: ListView(
          children: [
            Gap(16),
            CustomTextFormField(
              hintText: "الاسم الكامل",
              keyboardType: TextInputType.name,
              controller: fullNameController,
              onSaved: (value) {
                provider.addressEntity?.name = value ?? "";
              },
            ),
            Gap(8),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              onSaved: (value) {
                provider.addressEntity?.email = value ?? "";
              },
            ),
            Gap(8),
            CustomTextFormField(
              hintText: "العنوان",
              keyboardType: TextInputType.text,
              controller: addressController,
              onSaved: (value) {
                provider.addressEntity?.address = value ?? "";
              },
            ),
            Gap(8),
            CustomTextFormField(
              hintText: "المدينه",
              keyboardType: TextInputType.text,
              controller: cityNameController,
              onSaved: (value) {
                provider.addressEntity?.city = value ?? "";
              },
            ),
            Gap(8),
            CustomTextFormField(
              hintText: "رقم الطابق , رقم الشقه ..",
              keyboardType: TextInputType.text,
              controller: addressController2,
              onSaved: (value) {
                provider.addressEntity?.floor = value ?? "";
              },
            ),
            Gap(8),
            CustomTextFormField(
              hintText: "رقم الهاتف",
              keyboardType: TextInputType.phone,
              controller: phoneController,
              onSaved: (value) {
                provider.addressEntity?.phone = value ?? "";
              },
            ),
            Gap(16),
            // Row(
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
