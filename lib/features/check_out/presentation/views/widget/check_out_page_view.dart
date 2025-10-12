import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utils/app_constant.dart';

import '../../../../../core/helper_functions/get_steps_item.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: vrAppPadding),
      child: PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getSteps().length,
        itemBuilder: (context, index) {
          return getStepsPages()[index];
        },
      ),
    );
  }
}
