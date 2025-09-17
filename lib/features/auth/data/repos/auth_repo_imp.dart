import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/custom_exceptions.dart';
import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/core/service/database_service.dart';
import 'package:fruits_app/features/auth/data/models/users_model.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';
import 'package:fruits_app/features/auth/domain/repos/repos.dart';

import '../../../../core/service/firebase_auth_service.dart';
import '../../../../core/utils/end_points.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp(
      {required this.firebaseAuthService, required this.databaseService});
  //create user with email and password
  @override
  Future<Either<Failuer, UsersEntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    //return user success
    try {
      //create account
      user = await firebaseAuthService.createAccountWithEmailAndPassword(
        email: email,
        password: password,
      );
      //add user data to firestore (save user info)
      var userEntity = UsersEntites(
        name: name,
        email: email,
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      //return user
      return right(userEntity); //right=>.then()
    } // fail
    on CustomExceptions catch (e) {
      await deleteUserCheck(user);
      return left(ServerFailuer(e.eMsg)); //left=>.catchError()
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log("Exception in AuthrepoImp.createUserWithEmailAndPassword: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }

  //sign in with email and password
  @override
  Future<Either<Failuer, UsersEntites>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    //return user success
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userData = await getUserData<UsersEntites>(uId: user.uid);
      log("user info$userData");
      return right(userData); //right=>.then()
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

  //sign in with google
  @override
  Future<Either<Failuer, UsersEntites>> signInWithGoogle() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithGoogle();
      var isUserExist = await databaseService.isDataExist(
        path: EndPoints.isUserExist,
        docId: user.uid,
      );
      var userEntity = UserModel.fromFirbaseUser(user);
      await addUserData(user: userEntity);
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity); //right=>.then()
    } // fail
    catch (e) {
      await deleteUserCheck(user);
      log("Exception in AuthrepoImp.signInWithGoogle: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }

  //sign in with facebook
  Future<Either<Failuer, UsersEntites>> signInWithFacebook() async {
    User? user;
    try {
      var isUserExist = await databaseService.isDataExist(
        path: EndPoints.isUserExist,
        docId: user!.uid,
      );
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirbaseUser(user);
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity); //right=>.then()
    } // fail
    catch (e) {
      await deleteUserCheck(user);
      log("Exception in AuthrepoImp.signInWithFacebook: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }

  //sign in with apple
  @override
  Future<Either<Failuer, UsersEntites>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirbaseUser(user);
      await addUserData(user: userEntity);
      return right(UserModel.fromFirbaseUser(user)); //right=>.then()
    } // fail
    catch (e) {
      await deleteUserCheck(user);
      log("Exception in AuthrepoImp.signInWithApple: ${e.toString()}");
      return left(ServerFailuer(
        "لقد حدث خطأ ما يرجى المحاولة في وقت لاحق",
      ));
    }
  }

  //add user data to firestore
  @override
  Future addUserData({required UsersEntites user}) async {
    try {
      await databaseService.addData(
        path: EndPoints.addUserData,
        data: user.toMap(),
        docId: user.uId,
      );
    } catch (e) {
      log("Exception in AuthrepoImp.addUserData: ${e.toString()}");
      throw Exception("لقد حدث خطأ ما يرجى المحاولة في وقت لاحق");
    }
  }

//delete user if sign in fail
  Future<void> deleteUserCheck(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  //get user data from firestore
  @override
  Future getUserData<UsersEntites>({required String uId}) async {
    var userData = await databaseService.getData(
      path: EndPoints.getUserData,
      docId: uId,
    );
    return UserModel.fromJson(userData);
  }
}
