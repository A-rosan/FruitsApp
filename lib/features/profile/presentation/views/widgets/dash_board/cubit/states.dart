abstract class DashBoardStates {}

class DashBoardInitialState extends DashBoardStates {}

class DashBoardLoadingState extends DashBoardStates {}

class AddProductErrorState extends DashBoardStates {
  final String errorMsg;
  AddProductErrorState(this.errorMsg);
}

class AddProductSuccessState extends DashBoardStates {}
