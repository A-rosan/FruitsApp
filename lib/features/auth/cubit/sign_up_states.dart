import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccsessState extends SignUpStates {
  final UsersEntites usersIntites;

  SignUpSuccsessState({required this.usersIntites});
}

class SignUpFailuer extends SignUpStates {
  final String errorMsg;

  SignUpFailuer({required this.errorMsg});
}
