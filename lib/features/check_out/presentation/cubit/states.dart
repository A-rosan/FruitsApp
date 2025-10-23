import '../../domain/order_entity.dart';

abstract class AddOrderStates {}

class OrderInitialState extends AddOrderStates {}

class OrderLoadingState extends AddOrderStates {}

class AddOrderSuccessState extends AddOrderStates {}

class AddOrderErrorState extends AddOrderStates {
  final String error;

  AddOrderErrorState(this.error);
}

// class FetchOrdersLoadingState extends AddOrderStates {}

class FetchOrdersSuccessState extends AddOrderStates {
  final List<OrderEntity> orders;

  FetchOrdersSuccessState({required this.orders});
}

class FetchOrdersErrorState extends AddOrderStates {
  final String error;

  FetchOrdersErrorState(this.error);
}
