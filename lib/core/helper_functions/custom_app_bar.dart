import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

AppBar appBarBuild(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyle.bold19,
    ),
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios_new,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );
}
