import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../check_out/domain/repo/orders_repo/orders_repo.dart';
import '../../../check_out/presentation/cubit/cubit.dart';
import '../../../check_out/presentation/cubit/states.dart';
import '../../../check_out/presentation/views/widget/add_order_cubit_bloc_builder/add_order_cubit_bloc_builder.dart';
import 'widget/order_body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const String routName = 'orderScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepos>(),
      )..fetchOrders(),
      child: Scaffold(
        appBar: appBarBuild(
          context,
          title: 'الطلبات',
          isLeading: false,
        ),
        body: BlocConsumer<AddOrderCubit, AddOrderStates>(
          listener: (context, state) {
            if (state is FetchOrdersSuccessState) {
              customSuccessBar(context, "تم جلب الطلبات بنجاح");
            }
            if (state is FetchOrdersErrorState) {
              showCustomErrorSnackBar(context, state.error);
            }
          },
          builder: (context, state) => CustomProgressHud(
            isLoading: state is FetchOrderLoadingState,
            child: OrderBody(),
          ),
        ),
      ),
    );
  }
}
