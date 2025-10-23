import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_progress_hud.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/states.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderStates>(
        listener: (context, state) {
      if (state is AddOrderSuccessState) {
        customSuccessBar(context, "تم إضافة الطلب بنجاح");
      }
      if (state is FetchOrdersSuccessState) {
        customSuccessBar(context, "تم جلب الطلبات بنجاح");
      }
      if (state is FetchOrdersErrorState) {
        showCustomErrorSnackBar(context, state.error);
      }
      if (state is AddOrderErrorState) {
        showCustomErrorSnackBar(context, state.error);
      }
    }, builder: (context, state) {
      return CustomProgressHud(
        isLoading: state is OrderLoadingState,
        child: child,
      );
    });
  }
}
