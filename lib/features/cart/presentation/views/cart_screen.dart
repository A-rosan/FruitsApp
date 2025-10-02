import 'package:flutter/material.dart';
import 'package:fruits_app/features/cart/presentation/views/widgets/cart_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'السلة',
        isLeading: true,
      ),
      body: CartBody(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.center,
    );
  }
}
