import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/get_it_service.dart';
import 'package:fruits_app/features/auth/cubit/sign_up_states.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helper_functions/custom_app_bar.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../cubit/sign_up_cubit.dart';
import '../../domain/repos/repos.dart';
import 'widget/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const String routName = "signUp";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: appBarBuild(
          context,
          title: "حساب جديد",
        ),
        body: Builder(builder: (context) {
          return BlocConsumer<SignUpCubit, SignUpStates>(
            listener: (context, state) {
              if (state is SignUpSuccsessState) {
                customSuccessBar(context, "تم التسجيل بنجاح");
                Navigator.pushReplacementNamed(context, "login");
              }
              if (state is SignUpFailuer) {
                customSnackBar(context, state);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is SignUpLoadingState ? true : false,
                child: SignUpBody(),
              );
            },
          );
        }),
      ),
    );
  }
}
