import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_btm_nav_bar.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import 'widgets/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocConsumer<NavigationCubit, NavigateStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NavigationCubit.get(context);
          return Scaffold(
            bottomNavigationBar: const CustomBtmNavBar(),
            body: SafeArea(
              child: cubit.screens[cubit.currentIndex],
            ),
          );
        },
      ),
    );
  }
}
