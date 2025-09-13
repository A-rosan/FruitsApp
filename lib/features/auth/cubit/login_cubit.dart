import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/cubit/login_states.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';

// import '../data/repos/auth_repo_imp.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authRepo) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  Future<void> signIn(String email, String password) async {
    emit(LoginLoadingState());
    final res = await authRepo.signInWithEmailAndPassword(email, password);
    res.fold(
      (failuer) => emit(LoginFailuer(errorMsg: failuer.msg)),
      (usersIntites) => emit(LoginSuccsessState(usersIntites: usersIntites)),
    );
  }
}
