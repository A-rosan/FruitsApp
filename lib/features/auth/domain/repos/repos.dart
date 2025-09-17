import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuers.dart';
import 'package:fruits_app/features/auth/domain/entites/users_intites.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UsersEntites>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  Future<Either<Failuer, UsersEntites>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failuer, UsersEntites>> signInWithGoogle();
  Future<Either<Failuer, UsersEntites>> signInWithFacebook();
  Future<Either<Failuer, UsersEntites>> signInWithApple();
  Future addUserData({required UsersEntites user});
  Future getUserData<UsersEntites>({required String uId});
}
