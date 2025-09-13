import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../cubit/login_cubit.dart';
import '../../cubit/login_states.dart';
import '../../domain/repos/repos.dart';
import 'widget/loging_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routName = "login";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        body: Builder(builder: (context) {
          return BlocConsumer<LoginCubit, LoginStates>(
            listener: (context, state) {
              // if (state is LoginSuccsessState) {
              //   navigate to home screen
              // }
              if (state is LoginFailuer) {
                customSnackBar(context, state);
              }
            },
            builder: (context, state) {
              return CustomProgressHud(
                isLoading: state is LoginLoadingState ? true : false,
                child: LoginBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
