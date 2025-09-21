abstract class NavigateStates {}

class NavigateInitialState extends NavigateStates {}

class ChangeNavBarState extends NavigateStates {}

class NavigateLoadingState extends NavigateStates {}

class NavigateSuccessState extends NavigateStates {}

class NavigateErrorState extends NavigateStates {
  final String error;
  NavigateErrorState(this.error);
}
