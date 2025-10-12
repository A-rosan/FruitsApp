import 'package:flutter/material.dart';
import 'package:fruits_app/features/check_out/presentation/views/widget/un_active_step_item.dart';

import 'active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.index,
      required this.title,
      required this.isActive});
  final String title;
  final int index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: UnActiveStepItem(
        index: index,
        title: title,
      ),
      secondChild: ActiveStepItem(
        title: title,
      ),
      duration: Duration(milliseconds: 300),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}
