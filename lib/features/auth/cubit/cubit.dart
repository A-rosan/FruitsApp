import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/features/auth/cubit/states.dart';
// import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authRepo) : super(SignUpInitState());
  static SignUpCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignUpLoadingState());
    final res = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    res.fold(
      (failuer) => emit(SignUpFailuer(errorMsg: failuer.msg)),
      (usersIntites) => emit(SignUpSuccsessState(usersIntites: usersIntites)),
    );
  }
}
