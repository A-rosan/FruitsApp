import '../domain/entites/users_intites.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccsessState extends LoginStates {
  final UsersEntites usersIntites;

  LoginSuccsessState({required this.usersIntites});
}

class LoginFailuer extends LoginStates {
  final String errorMsg;

  LoginFailuer({required this.errorMsg});
}
