import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/custom_exceptions.dart';
import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/features/auth/data/models/users_model.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';

import '../../../../core/service/firebase_auth_service.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});

  @override
  Future<Either<Failuer, UsersIntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    //return user success
    try {
      var user = await firebaseAuthService.createAccountWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirbaseUser(user)); //right=>.then()
    } // fail
    on CustomExceptions catch (e) {
      return left(ServerFailuer(e.eMsg)); //left=>.catchError()
    } catch (e) {
      log("Exception in AuthrepoImp.createUserWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }

  @override
  Future<Either<Failuer, UsersIntites>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    //return user success
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirbaseUser(user)); //right=>.then()
    } // fail
    on CustomExceptions catch (e) {
      return left(ServerFailuer(e.eMsg)); //left=>.catchError()
    } catch (e) {
      log("Exception in AuthrepoImp.signInWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }
}
