import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/get_it_service.dart';
import 'package:fruits_app/features/cart/domain/entity/cart_entity.dart';
import 'package:provider/provider.dart';
// import 'package:fruits_app/features/cart/domain/entity/cart_items_entity.dart';

import '../../../../core/helper_functions/get_user_data.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/address_entity.dart';
import '../../domain/order_entity.dart';
import '../../domain/repo/orders_repo/orders_repo.dart';
import '../cubit/cubit.dart';
import 'widget/add_order_cubit_bloc_builder/add_order_cubit_bloc_builder.dart';
import 'widget/check_out_body.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key, required this.cartEntity});
  static const String routName = 'checkOutScreen';
  CartEntity cartEntity;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  late final OrderEntity orderEntity;

  @override
  void initState() {
    super.initState();
    orderEntity = OrderEntity(
        cartEntity: widget.cartEntity,
        addressEntity: AddressEntity(),
        userId: getUserData().uId);
  }

  @override
  void dispose() {
    orderEntity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepos>(),
      ),
      child: Scaffold(
        appBar: appBarBuild(
          context,
          title: 'الشحن',
        ),
        body: ChangeNotifierProvider.value(
          value: orderEntity,
          child: AddOrderCubitBlocBuilder(child: CheckOutBody()),
        ),
      ),
    );
  }
}
