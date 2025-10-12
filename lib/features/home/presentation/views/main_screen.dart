import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/cubit/states.dart';

import '../../../../core/widgets/custom_btm_nav_bar.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../cart/cubit/cubit.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
// import 'widgets/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const String routName = 'home';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<CartCubit, CartStates>(
            listener: (context, state) {
              if (state is AddCartItemState) {
                customSuccessBar(
                  context,
                  "تم اضافة المنتج الي السلة بنجاح",
                );
              }
              if (state is RemoveCartItemState) {
                customSuccessBar(
                  context,
                  "تم حذف المنتج من السلة بنجاح",
                );
              }
            },
          ),
          BlocListener<NavigationCubit, NaviBarStates>(
            listener: (context, state) {},
          ),
        ],
        child: BlocBuilder<NavigationCubit, NaviBarStates>(
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
      ),
    );
  }
}
