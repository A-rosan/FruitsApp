import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/home/domain/entities.dart';
import '../../features/home/cubit/cubit.dart';
import '../../features/home/cubit/states.dart';
import '../../features/home/presentation/views/widgets/nav_bar_item.dart';

class CustomBtmNavBar extends StatefulWidget {
  const CustomBtmNavBar({
    super.key,
  });

  @override
  State<CustomBtmNavBar> createState() => _CustomBtmNavBarState();
}

class _CustomBtmNavBarState extends State<CustomBtmNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigateStates>(
        builder: (context, state) {
      var cubit = NavigationCubit.get(context);
      return Container(
        width: double.infinity,
        height: 70,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 0,
              blurRadius: 25,
              offset: const Offset(0, -2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: BtmNavBarEntity(
              activeImage: "assets/images/fill_home.svg",
              unActiveImage: "assets/images/home.svg",
              name: "الرئيسية",
            ).btmNavItemsList.asMap().entries.map(
              (item) {
                var index = item.key;
                var entity = item.value;
                return GestureDetector(
                  onTap: () {
                    cubit.changeNavBar(index);
                  },
                  child: NavBarItem(
                    isActive: cubit.currentIndex == index,
                    item: entity,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );
    });
  }
}
