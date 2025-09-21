import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../best_selling/presentation/views/best_selling_screen.dart';
import '../../cart/presentation/views/cart_screen.dart';
import '../../products/presentation/views/products_screen.dart';
import '../../profile/presentation/views/profile_screen.dart';
import '../presentation/views/widgets/home_screen.dart';
import 'states.dart';

class NavigationCubit extends Cubit<NavigateStates> {
  NavigationCubit() : super(NavigateInitialState());
  static NavigationCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ProductsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  void changeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
