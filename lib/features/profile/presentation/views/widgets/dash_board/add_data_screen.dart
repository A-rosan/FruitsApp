import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';

class AddDataScreen extends StatelessWidget {
  const AddDataScreen({super.key});
  static const String routName = 'dashBoard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBuild(
          context,
          title: 'مالك التطبيق',
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              buttonText: "اضافة بيانات",
              onPressed: () => Navigator.pushNamed(context, 'dashBoardBody'),
            ),
          ),
        ));
  }
}
