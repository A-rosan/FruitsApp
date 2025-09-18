import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
// import 'custom_out_line_border.dart';
import 'custom_out_line_search_boeder.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            spreadRadius: 0,
            blurRadius: 9,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: Image.asset("assets/images/setting_icon.png"),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(17.0),
            child: SvgPicture.asset(
              "assets/images/search-normal.svg",
            ),
          ),
          hintText: "ابحث عن.......",
          hintStyle: AppTextStyle.regular13.copyWith(color: AppColors.greyText),
          filled: true,
          fillColor: Colors.white,
          border: borderSearchBuild(),
          enabledBorder: borderSearchBuild(),
          focusedBorder: borderSearchBuild(),
        ),
      ),
    );
  }
}
