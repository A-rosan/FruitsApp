abstract class AddOrderStates {}

class AddOrderInitialState extends AddOrderStates {}

class AddOrderLoadingState extends AddOrderStates {}

class AddOrderSuccessState extends AddOrderStates {}

class AddOrderErrorState extends AddOrderStates {
  final String error;

  AddOrderErrorState(this.error);
}
