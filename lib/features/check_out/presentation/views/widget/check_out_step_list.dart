import 'package:flutter/material.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/step_item.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/un_active_step_item.dart';

import '../../../../../core/helper_functions/get_steps_item.dart';
import 'active_step_item.dart';
// import 'un_active_step_item.dart';

class CheckOutStepList extends StatelessWidget {
  const CheckOutStepList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(getSteps().length, (index) {
          return Expanded(
            child: StepItem(
              title: getSteps()[index],
              index: index + 1,
              isActive: false,
            ),
          );
        }),
      ],
    );
  }
}
