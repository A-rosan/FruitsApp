import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_btm_nav_bar.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBtmNavBar(),
      body: SafeArea(child: HomeBody()),
    );
  }
}
