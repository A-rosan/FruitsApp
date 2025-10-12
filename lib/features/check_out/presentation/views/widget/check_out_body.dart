import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/check_out_page_view.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/check_out_step_list.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helper_functions/get_steps_item.dart';
import 'active_step_item.dart';
import 'un_active_step_item.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: hrAppPadding, vertical: vrAppPadding),
      child: Column(
        children: [
          CheckOutStepList(),
          Expanded(
            child: CheckOutPageView(pageController: pageController),
          ),
          CustomButton(
            buttonText: "التالي",
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          Gap(30),
        ],
      ),
    );
  }
}
