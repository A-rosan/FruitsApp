abstract class NaviBarStates {}

class NavBarInitialState extends NaviBarStates {}

class NavBarSuccessState extends NaviBarStates {}

class NavBarLoadingState extends NaviBarStates {}

class NavBarErrorState extends NaviBarStates {
  final String error;
  NavBarErrorState(this.error);
}
