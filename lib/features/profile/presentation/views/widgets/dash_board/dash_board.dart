import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_app_bar.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});
  static const String routeName = 'dashBoard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'مالك التطبيق',
      ),
      body: Center(
        child: Text('DashBoard Screen'),
      ),
    );
  }
}
