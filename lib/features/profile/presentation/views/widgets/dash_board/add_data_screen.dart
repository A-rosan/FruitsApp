import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../orders/presentation/views/order_screen.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                buttonText: "اضافة بيانات",
                onPressed: () => Navigator.pushNamed(context, 'dashBoardBody'),
              ),
              Gap(20),
              CustomButton(
                buttonText: "عرض البيانات",
                onPressed: () =>
                    Navigator.pushNamed(context, OrderScreen.routName),
              ),
            ],
          ),
        ));
  }
}
