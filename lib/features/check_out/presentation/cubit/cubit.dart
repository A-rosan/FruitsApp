import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/order_entity.dart';
import '../../domain/repo/orders_repo/orders_repo.dart';
import 'states.dart';

class AddOrderCubit extends Cubit<AddOrderStates> {
  final OrdersRepos ordersRepos;

  AddOrderCubit(this.ordersRepos) : super(AddOrderInitialState());

  static AddOrderCubit get(context) => BlocProvider.of(context);

  void addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoadingState());
    final result = await ordersRepos.addOrder(orderEntity);
    result.fold(
      (failuer) => emit(AddOrderErrorState(failuer.msg)),
      (success) => emit(AddOrderSuccessState()),
    );
  }
}
