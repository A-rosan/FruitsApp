import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/order_entity.dart';
import '../../domain/repo/orders_repo/orders_repo.dart';
import 'states.dart';

class AddOrderCubit extends Cubit<AddOrderStates> {
  AddOrderCubit(this.ordersRepos) : super(OrderInitialState());

  static AddOrderCubit get(context) => BlocProvider.of(context);

  final OrdersRepos ordersRepos;
  // Holds the fetched orders so UI or other logic can access them after a fetch
  List<OrderEntity> orders = [];

  void addOrder(OrderEntity orderEntity) async {
    log('Adding order...');
    if (isClosed) return; // avoid doing work if cubit already closed

    try {
      emit(OrderLoadingState());
      final result = await ordersRepos.addOrder(orderEntity);
      result.fold(
        (failuer) {
          if (!isClosed) emit(AddOrderErrorState(failuer.msg));
        },
        (success) {
          if (!isClosed) emit(AddOrderSuccessState());
        },
      );
    } catch (e) {
      // If an unexpected exception occurs, emit an error state if still open.
      emit(AddOrderErrorState(e.toString()));
    }
  }

  Future<void> fetchOrders() async {
    if (isClosed) return;
    log('Fetching orders...');
    try {
      if (!isClosed) emit(FetchOrderLoadingState());
      final result = await ordersRepos.getOrders();
      result.fold(
        (failure) {
          if (!isClosed) emit(FetchOrdersErrorState(failure.msg));
        },
        (fetchedOrders) {
          // store locally for later use
          orders = fetchedOrders;
          if (!isClosed) emit(FetchOrdersSuccessState(orders: fetchedOrders));
        },
      );
    } catch (e) {
      if (!isClosed) emit(FetchOrdersErrorState(e.toString()));
    }
  }
}
