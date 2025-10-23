import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_constant.dart';
import 'package:fruits_app/features/check_out/presentation/cubit/cubit.dart';
// import 'package:fruits_app/core/utils/app_text_style.dart';
import 'package:fruits_app/features/orders/presentation/views/widget/filter_section.dart';

import '../../../../check_out/presentation/views/widget/add_order_cubit_bloc_builder/add_order_cubit_bloc_builder.dart';
import 'order_item.dart';
// import 'package:fruits_app/features/orders/presentation/views/widget/order_item.dart';
// import 'package:gap/gap.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddOrderCubit.get(context);
    return AddOrderCubitBlocBuilder(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: hrAppPadding, vertical: vrAppPadding),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FilterSection(),
            OrderItem(
              orders: cubit.orders,
            ),
          ],
        ),
      ),
    );
  }
}
