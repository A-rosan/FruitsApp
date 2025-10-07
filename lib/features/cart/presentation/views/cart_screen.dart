import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/cubit/cubit.dart';
import 'package:fruits_app/features/cart/cubit/states.dart';
// import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';
import 'package:fruits_app/features/cart/presentation/views/widgets/cart_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });
  // final List<CartEntity> cartList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'السلة',
        isLeading: true,
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return CartBody(
            cartItems: cubit.cartEntity.cartItems!,
          );
        },
      ),
    );
  }
}
