import 'package:flutter/material.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';
import 'package:provider/provider.dart';
// import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/address_entity.dart';
import '../../domain/order_entity.dart';
import 'widget/check_out_body.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key, required this.cartEntity});
  static const String routName = 'checkOutScreen';
  CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuild(
        context,
        title: 'الشحن',
      ),
      body: Provider.value(
          value: OrderEntity(
            cartEntity: cartEntity,
            addressEntity: AddressEntity(),
          ),
          child: CheckOutBody()),
    );
  }
}
