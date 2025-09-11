import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class CustomPassField extends StatefulWidget {
  CustomPassField({
    super.key,
    required this.passwordController,
    this.onSaved,
  });

  final TextEditingController passwordController;
  void Function(String?)? onSaved;

  @override
  State<CustomPassField> createState() => _CustomPassFieldState();
}

class _CustomPassFieldState extends State<CustomPassField> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: (value) => widget.onSaved,
      controller: widget.passwordController,
      isPass: isPassword,
      keyboardType: TextInputType.visiblePassword,
      hintText: "كلمة المرور",
      suffixIcon: GestureDetector(
        onTap: () => setState(() => isPassword = !isPassword),
        child: isPassword
            ? Icon(Icons.remove_red_eye)
            : Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
    );
  }
}
