import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widget/check_out_body.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  static const String routName = 'checkOutScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'الشحن',
      ),
      body: CheckOutBody(),
    );
  }
}
